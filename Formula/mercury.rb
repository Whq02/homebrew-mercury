# Homebrew formula for Mercury — the tap is github.com/Whq02/homebrew-mercury
#   brew install Whq02/mercury/mercury
# The sha256 values come from the release's SHA256SUMS.txt.
class Mercury < Formula
  desc "AI coding sessions in your terminal, on the providers you choose"
  homepage "https://mercury-cli.ai"
  version "1.1.0"
  license "SEE LICENSE IN https://github.com/Whq02/MercuryCLI/blob/main/LICENSE.md"

  on_macos do
    on_arm do
      url "https://github.com/Whq02/MercuryCLI/releases/download/v1.1.0/mercury-v1.1.0-macos-arm64.tar.gz"
      sha256 "57f474bce0d489e915e31ec8d1036aa45732b3231352c03bd65ca6e36b98d45f"
    end
    on_intel do
      url "https://github.com/Whq02/MercuryCLI/releases/download/v1.1.0/mercury-v1.1.0-macos-x64.tar.gz"
      sha256 "79998c132660ab6a7212673a4e9a2ed2edc9b833ca37608cd88bc311dd29ca68"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/Whq02/MercuryCLI/releases/download/v1.1.0/mercury-v1.1.0-linux-x64.tar.gz"
      sha256 "ce792eda2ad8f4870ecdd6b722a16d2d8a4b72d90141e92cf09a877e6175fc51"
    end
  end

  # Mercury's payload is signed as packed, and Homebrew alters a keg after
  # `install` returns: it moves LICENSE.md and NOTICE out of libexec, its cleaner
  # deletes a Python RECORD, and on macOS its linkage step rewrites the IDs of
  # the dynamic libraries and signs them again. `mercury health --deep` then
  # reads TAMPERED. skip_clean keeps the cleaner out of libexec; what the other
  # two alter is kept as packed in a tar and put back after the install.
  skip_clean "libexec"

  def install
    # The archive is self-contained (bundle + its own Node runtime + ripgrep);
    # it lives whole under libexec and the launcher is called by its real path.
    libexec.install Dir["*"]
    as_packed = %w[LICENSE.md NOTICE]
    as_packed += Dir.glob("**/*.{dylib,node,so}", File::FNM_DOTMATCH, base: libexec) if OS.mac?
    as_packed.select! { |path| (libexec/path).file? && !(libexec/path).symlink? }
    (prefix/"as-packed").mkpath
    system "tar", "-cf", prefix/"as-packed/payload.tar", "-C", libexec, *as_packed
    # The release this formula installs writes the launcher of Mercury's own
    # installer to ~/.local/bin/mercury at every start. From a Homebrew install
    # that launcher cannot run, and ahead of Homebrew on PATH it is the command
    # the shell finds. Mercury leaves a file in that place alone when it is not
    # that launcher, so this wrapper keeps a link to itself there. Restore
    # `bin.write_exec_script libexec/"mercury"` with the release that fixes it.
    (bin/"mercury").write <<~SH
      #!/bin/bash
      if [ -n "${HOME:-}" ] && [ -z "${MERCURY_VERSIONS_DIR:-}" ]; then
        mercury_home="${MERCURY_CONFIG_DIR:-${MERCURY_HOME:-$HOME/.mercury}}"
        mercury_link="$HOME/.local/bin/mercury"
        [ -f "$HOME/.mercury/versions/current.txt" ] && mercury_home="$HOME/.mercury"
        if [ ! -f "$mercury_home/versions/current.txt" ]; then
          if [ ! -e "$mercury_link" ] && [ ! -L "$mercury_link" ]; then
            mkdir -p "$HOME/.local/bin" 2>/dev/null && ln -s "#{opt_bin}/mercury" "$mercury_link" 2>/dev/null
          elif [ -f "$mercury_link" ] && [ ! -L "$mercury_link" ] && grep -q 'mercury-managed-''shim' "$mercury_link" 2>/dev/null; then
            ln -sf "#{opt_bin}/mercury" "$mercury_link" 2>/dev/null
          fi
        fi
      fi
      exec "#{libexec}/mercury" "$@"
    SH
    (bin/"mercury").chmod 0755
  end

  if respond_to?(:post_install_steps)
    post_install_steps do
      run "tar", args: ["-xpf", "{{prefix}}/as-packed/payload.tar", "-C", "{{libexec}}"]
    end
  else
    def post_install
      system "tar", "-xpf", prefix/"as-packed/payload.tar", "-C", libexec
    end
  end

  def caveats
    <<~EOS
      If `mercury` stops with "no managed install", a launcher that Mercury
      left in ~/.local/bin is shadowing this one. Put this formula's in its place:
        ln -sf "#{opt_bin}/mercury" ~/.local/bin/mercury
    EOS
  end

  test do
    assert_match "Mercury", shell_output("#{bin}/mercury --version")
    system libexec/"vendor/node/bin/node", libexec/"verify-artifact.mjs", "--deep"
  end
end
