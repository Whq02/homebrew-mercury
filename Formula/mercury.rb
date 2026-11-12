# Homebrew formula for Mercury — the tap is github.com/Whq02/homebrew-mercury
#   brew install Whq02/mercury/mercury
# The sha256 values come from the release's SHA256SUMS.txt.
class Mercury < Formula
  desc "AI coding sessions in your terminal, on the providers you choose"
  homepage "https://mercury-cli.ai"
  version "1.0.10"
  license "SEE LICENSE IN https://github.com/Whq02/MercuryCLI/blob/main/LICENSE.md"

  on_macos do
    on_arm do
      url "https://github.com/Whq02/MercuryCLI/releases/download/v1.0.10/mercury-v1.0.10-macos-arm64.tar.gz"
      sha256 "9a670fc286a8f35df8e72e3b25da4ae9b5cbb05c1f63e1951a85d5fd47d0a5a1"
    end
    on_intel do
      url "https://github.com/Whq02/MercuryCLI/releases/download/v1.0.10/mercury-v1.0.10-macos-x64.tar.gz"
      sha256 "b917cf84a46638bf372f1d2a091ca2b2e1a86541d79bd325162975246a3424ee"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/Whq02/MercuryCLI/releases/download/v1.0.10/mercury-v1.0.10-linux-x64.tar.gz"
      sha256 "22cfb42571a517227bdaa198e824f68d18860fee33c07ea16e7eb08252ad3605"
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
