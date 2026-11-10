# Homebrew formula for Mercury — the tap is github.com/Whq02/homebrew-mercury
#   brew install Whq02/mercury/mercury
# The sha256 values come from the release's SHA256SUMS.txt.
class Mercury < Formula
  desc "AI coding sessions in your terminal, on the providers you choose"
  homepage "https://mercury-cli.ai"
  version "1.0.9"
  license "SEE LICENSE IN https://github.com/Whq02/MercuryCLI/blob/main/LICENSE.md"

  on_macos do
    on_arm do
      url "https://github.com/Whq02/MercuryCLI/releases/download/v1.0.9/mercury-v1.0.9-macos-arm64.tar.gz"
      sha256 "0f79e2c5f69c0b655e0bdda82c5a1761fe0aea98cde6c013a1692fdf886154bd"
    end
    on_intel do
      url "https://github.com/Whq02/MercuryCLI/releases/download/v1.0.9/mercury-v1.0.9-macos-x64.tar.gz"
      sha256 "5bab751af27f02db898be324c82bf63ec7aea1dc48dd814e870ff4077cf3df47"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/Whq02/MercuryCLI/releases/download/v1.0.9/mercury-v1.0.9-linux-x64.tar.gz"
      sha256 "f7fd0071e014cc6e1bdcd83276932361216c2cd0084a92628c4f670269392e5d"
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
