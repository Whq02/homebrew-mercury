# Homebrew formula for Mercury — the tap is github.com/Whq02/homebrew-mercury
#   brew install Whq02/mercury/mercury
# The sha256 values come from the release's SHA256SUMS.txt.
class Mercury < Formula
  desc "AI coding sessions in your terminal, on the providers you choose"
  homepage "https://mercury-cli.ai"
  version "1.0.0-beta.27"
  license "SEE LICENSE IN https://github.com/Whq02/MercuryCLI/blob/main/LICENSE.md"

  on_macos do
    on_arm do
      url "https://github.com/Whq02/MercuryCLI/releases/download/v1.0.0-beta.27/mercury-v1.0.0-beta.27-macos-arm64.tar.gz"
      sha256 "fd7abab7336787fe6af39e2c6c1773ca98637d0da3703671baf99ac37a44d26f"
    end
    on_intel do
      url "https://github.com/Whq02/MercuryCLI/releases/download/v1.0.0-beta.27/mercury-v1.0.0-beta.27-macos-x64.tar.gz"
      sha256 "50c6abafe2d117ffcb3d6d83dfaba9e56552f9084ec4240eedfa1222cab7bbe8"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/Whq02/MercuryCLI/releases/download/v1.0.0-beta.27/mercury-v1.0.0-beta.27-linux-x64.tar.gz"
      sha256 "9cbf9867a673ae095f9e405473b6fc647faa2c9ebfe24ccd7b5288140470b49c"
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
