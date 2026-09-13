# Homebrew formula for Mercury — the tap is github.com/Whq02/homebrew-mercury
#   brew install Whq02/mercury/mercury
# The sha256 values come from the release's SHA256SUMS.txt.
class Mercury < Formula
  desc "Terminal harness for software development"
  homepage "https://mercury-cli.ai"
  version "1.0.0-beta.10"
  license "SEE LICENSE IN https://github.com/Whq02/MercuryCLI/blob/main/LICENSE.md"

  on_macos do
    on_arm do
      url "https://github.com/Whq02/MercuryCLI/releases/download/v1.0.0-beta.10/mercury-v1.0.0-beta.10-macos-arm64.tar.gz"
      sha256 "a60a4b5da14fd1bc762a5b90455d0b518aa28aae15515e376d14b03861707cb3"
    end
    on_intel do
      url "https://github.com/Whq02/MercuryCLI/releases/download/v1.0.0-beta.10/mercury-v1.0.0-beta.10-macos-x64.tar.gz"
      sha256 "b0cc3aa4b84a6bef0d3c3b1ef01335b7283ac74e6f78157e290dcd59e97b6119"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/Whq02/MercuryCLI/releases/download/v1.0.0-beta.10/mercury-v1.0.0-beta.10-linux-x64.tar.gz"
      sha256 "5c61ddb17531cf02367212e07720903cf764a269f34c235e5e9348f46c5bf3e6"
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
