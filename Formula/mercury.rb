# Homebrew formula for Mercury — the tap is github.com/Whq02/homebrew-mercury
#   brew install Whq02/mercury/mercury
# The sha256 values come from the release's SHA256SUMS.txt.
class Mercury < Formula
  desc "AI coding sessions in your terminal, on the providers you choose"
  homepage "https://mercury-cli.ai"
  version "1.0.0-beta.36"
  license "SEE LICENSE IN https://github.com/Whq02/MercuryCLI/blob/main/LICENSE.md"

  on_macos do
    on_arm do
      url "https://github.com/Whq02/MercuryCLI/releases/download/v1.0.0-beta.36/mercury-v1.0.0-beta.36-macos-arm64.tar.gz"
      sha256 "43e48fea77efde16dd604256e6b2796bdee306e0cd019d62f74e5e59bc9649fb"
    end
    on_intel do
      url "https://github.com/Whq02/MercuryCLI/releases/download/v1.0.0-beta.36/mercury-v1.0.0-beta.36-macos-x64.tar.gz"
      sha256 "8d38df13547392949e4d62d227e064ebfa3c6bbc950a31229a564000b3c10356"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/Whq02/MercuryCLI/releases/download/v1.0.0-beta.36/mercury-v1.0.0-beta.36-linux-x64.tar.gz"
      sha256 "03cc92efec645c42f955a7fc0a0590dcb9f2c5c36f505e02cd8f497a0eb7d1bd"
    end
  end

  def install
    # The archive is self-contained (bundle + its own Node runtime + ripgrep);
    # it lives whole under libexec and the launcher is called by its real path.
    libexec.install Dir["*"]
    bin.write_exec_script libexec/"mercury"
  end

  test do
    assert_match "Mercury", shell_output("#{bin}/mercury --version")
  end
end
