# Homebrew formula for Mercury — the tap is github.com/Whq02/homebrew-mercury
#   brew install Whq02/mercury/mercury
# The sha256 values come from the release's SHA256SUMS.txt.
class Mercury < Formula
  desc "AI coding sessions in your terminal, on the providers you choose"
  homepage "https://mercury-cli.ai"
  version "1.0.8"
  license "SEE LICENSE IN https://github.com/Whq02/MercuryCLI/blob/main/LICENSE.md"

  on_macos do
    on_arm do
      url "https://github.com/Whq02/MercuryCLI/releases/download/v1.0.8/mercury-v1.0.8-macos-arm64.tar.gz"
      sha256 "cd5a903ceb87ecf8cf5cac7a922361a8b312c4b2a7afc1d0cab6dbd51212b0d0"
    end
    on_intel do
      url "https://github.com/Whq02/MercuryCLI/releases/download/v1.0.8/mercury-v1.0.8-macos-x64.tar.gz"
      sha256 "ff35485d684ad8820fed7e1cdf1f7937ebc6b6c83d2c706dc8cb4eb7fd4b5cd9"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/Whq02/MercuryCLI/releases/download/v1.0.8/mercury-v1.0.8-linux-x64.tar.gz"
      sha256 "fddc06465520f6a0cd9f22d5e8e46860562ac29ac20f157f11fdde05792763c9"
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
