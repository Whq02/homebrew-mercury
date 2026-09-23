# Homebrew formula for Mercury — the tap is github.com/Whq02/homebrew-mercury
#   brew install Whq02/mercury/mercury
# The sha256 values come from the release's SHA256SUMS.txt.
class Mercury < Formula
  desc "AI coding sessions in your terminal, on the providers you choose"
  homepage "https://mercury-cli.ai"
  version "1.0.0-beta.18"
  license "SEE LICENSE IN https://github.com/Whq02/MercuryCLI/blob/main/LICENSE.md"

  on_macos do
    on_arm do
      url "https://github.com/Whq02/MercuryCLI/releases/download/v1.0.0-beta.18/mercury-v1.0.0-beta.18-macos-arm64.tar.gz"
      sha256 "741834fc3c082ee48e4b800eed49bb004dce9bd853ad0efcfab3b866cdb4fccf"
    end
    on_intel do
      url "https://github.com/Whq02/MercuryCLI/releases/download/v1.0.0-beta.18/mercury-v1.0.0-beta.18-macos-x64.tar.gz"
      sha256 "6651931a6f15615c0ab398302884403adf6988068db4f876a963571c40f2d716"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/Whq02/MercuryCLI/releases/download/v1.0.0-beta.18/mercury-v1.0.0-beta.18-linux-x64.tar.gz"
      sha256 "d471898c34610dca9503e30f5f70f3fe543437e56756cd6ddeb281842ab91238"
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
