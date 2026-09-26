# Homebrew formula for Mercury — the tap is github.com/Whq02/homebrew-mercury
#   brew install Whq02/mercury/mercury
# The sha256 values come from the release's SHA256SUMS.txt.
class Mercury < Formula
  desc "AI coding sessions in your terminal, on the providers you choose"
  homepage "https://mercury-cli.ai"
  version "1.0.0-beta.21"
  license "SEE LICENSE IN https://github.com/Whq02/MercuryCLI/blob/main/LICENSE.md"

  on_macos do
    on_arm do
      url "https://github.com/Whq02/MercuryCLI/releases/download/v1.0.0-beta.21/mercury-v1.0.0-beta.21-macos-arm64.tar.gz"
      sha256 "f95cf4007e7acb9eb60b58aaf76c1d30d335d36f55cd91bd4bf4420b524925b3"
    end
    on_intel do
      url "https://github.com/Whq02/MercuryCLI/releases/download/v1.0.0-beta.21/mercury-v1.0.0-beta.21-macos-x64.tar.gz"
      sha256 "9734d4d220f0d0081552e7904e1d22f6c3ef8a1e92e51587b1edf0edce6bd871"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/Whq02/MercuryCLI/releases/download/v1.0.0-beta.21/mercury-v1.0.0-beta.21-linux-x64.tar.gz"
      sha256 "0776a56c48411b398b58bb6d3e23c90775960186e97ae1e83fe88073f720d158"
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
