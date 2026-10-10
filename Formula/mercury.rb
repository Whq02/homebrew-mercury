# Homebrew formula for Mercury — the tap is github.com/Whq02/homebrew-mercury
#   brew install Whq02/mercury/mercury
# The sha256 values come from the release's SHA256SUMS.txt.
class Mercury < Formula
  desc "AI coding sessions in your terminal, on the providers you choose"
  homepage "https://mercury-cli.ai"
  version "1.0.0-beta.31"
  license "SEE LICENSE IN https://github.com/Whq02/MercuryCLI/blob/main/LICENSE.md"

  on_macos do
    on_arm do
      url "https://github.com/Whq02/MercuryCLI/releases/download/v1.0.0-beta.31/mercury-v1.0.0-beta.31-macos-arm64.tar.gz"
      sha256 "dc966950b44f2ac6134a02020d0c93d522661e248f00210ebdb8b9ddaad1c4dc"
    end
    on_intel do
      url "https://github.com/Whq02/MercuryCLI/releases/download/v1.0.0-beta.31/mercury-v1.0.0-beta.31-macos-x64.tar.gz"
      sha256 "872058c5f6dc873d1eb96e7aeb1ec463b63671f0414ad82df61a0ab4e91ce82a"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/Whq02/MercuryCLI/releases/download/v1.0.0-beta.31/mercury-v1.0.0-beta.31-linux-x64.tar.gz"
      sha256 "b4bceeddc320abe746e8f2d5261051adfaf5a586708e246464879036f2ef4aa9"
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
