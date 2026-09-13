# Homebrew formula for Mercury — the tap is github.com/Whq02/homebrew-mercury
#   brew install Whq02/mercury/mercury
# The sha256 values come from the release's SHA256SUMS.txt.
class Mercury < Formula
  desc "Terminal harness for software development"
  homepage "https://mercury-cli.ai"
  version "1.0.0-beta.9"
  license "SEE LICENSE IN https://github.com/Whq02/MercuryCLI/blob/main/LICENSE.md"

  on_macos do
    on_arm do
      url "https://github.com/Whq02/MercuryCLI/releases/download/v1.0.0-beta.9/mercury-v1.0.0-beta.9-macos-arm64.tar.gz"
      sha256 "e86af8b6dda99430512b15932a020665c0969148cf428b3e684a37ac412d803d"
    end
    on_intel do
      url "https://github.com/Whq02/MercuryCLI/releases/download/v1.0.0-beta.9/mercury-v1.0.0-beta.9-macos-x64.tar.gz"
      sha256 "229920c504f5430d75ae4234604cd8e57d2ceeea1a097fa12bde756a1f080802"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/Whq02/MercuryCLI/releases/download/v1.0.0-beta.9/mercury-v1.0.0-beta.9-linux-x64.tar.gz"
      sha256 "688918e523acce4bc995c0076e9b7a9ab200f0ffd808b6826c699b2e09983416"
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
