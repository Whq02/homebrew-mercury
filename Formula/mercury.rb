# Homebrew formula for Mercury — the tap is github.com/Whq02/homebrew-mercury
#   brew install Whq02/mercury/mercury
# The sha256 values come from the release's SHA256SUMS.txt.
class Mercury < Formula
  desc "AI coding sessions in your terminal, on the providers you choose"
  homepage "https://mercury-cli.ai"
  version "1.0.12"
  license "SEE LICENSE IN https://github.com/Whq02/MercuryCLI/blob/main/LICENSE.md"

  on_macos do
    on_arm do
      url "https://github.com/Whq02/MercuryCLI/releases/download/v1.0.12/mercury-v1.0.12-macos-arm64.tar.gz"
      sha256 "85d73cba64ecd8add6af937362eda9e1ba8d0fc81f0852a3c1c1134979a87f8a"
    end
    on_intel do
      url "https://github.com/Whq02/MercuryCLI/releases/download/v1.0.12/mercury-v1.0.12-macos-x64.tar.gz"
      sha256 "51bd9d903c5ce740b0a3de89096334109eab843d734cab8b493f97866cd40648"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/Whq02/MercuryCLI/releases/download/v1.0.12/mercury-v1.0.12-linux-x64.tar.gz"
      sha256 "55fb28f622da3d1bde5416e06ecc7233bce3288b6edd8a1e7f8903ea8f3ff9b9"
    end
  end

  def install
    # The archive is self-contained (bundle + its own Node runtime + ripgrep);
    # it lives whole under libexec and the launcher is called by its real path.
    libexec.install Dir["*"]
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

  def caveats
    <<~EOS
      If `mercury` stops with "no managed install", a launcher that Mercury
      left in ~/.local/bin is shadowing this one. Put this formula's in its place:
        ln -sf "#{opt_bin}/mercury" ~/.local/bin/mercury
    EOS
  end

  test do
    assert_match "Mercury", shell_output("#{bin}/mercury --version")
  end
end
