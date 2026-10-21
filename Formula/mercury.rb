# Homebrew formula for Mercury — the tap is github.com/Whq02/homebrew-mercury
#   brew install Whq02/mercury/mercury
# The sha256 values come from the release's SHA256SUMS.txt.
class Mercury < Formula
  desc "AI coding sessions in your terminal, on the providers you choose"
  homepage "https://mercury-cli.ai"
  version "1.0.0-beta.40"
  license "SEE LICENSE IN https://github.com/Whq02/MercuryCLI/blob/main/LICENSE.md"

  on_macos do
    on_arm do
      url "https://github.com/Whq02/MercuryCLI/releases/download/v1.0.0-beta.40/mercury-v1.0.0-beta.40-macos-arm64.tar.gz"
      sha256 "344140b2c2a17bf37e4cf32dd30e0e8fc6de5364f3b341dade5d1deb2bc04f78"
    end
    on_intel do
      url "https://github.com/Whq02/MercuryCLI/releases/download/v1.0.0-beta.40/mercury-v1.0.0-beta.40-macos-x64.tar.gz"
      sha256 "d8d3a4f469b82d1b4a881017f02ceb32d0cba8938a0e977a51e2e169a7388ef7"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/Whq02/MercuryCLI/releases/download/v1.0.0-beta.40/mercury-v1.0.0-beta.40-linux-x64.tar.gz"
      sha256 "3d762fc4c8432f16c035a733888131de753f05987a7461f5074344ac24aa3e60"
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
