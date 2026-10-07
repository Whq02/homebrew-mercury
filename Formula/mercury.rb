# Homebrew formula for Mercury — the tap is github.com/Whq02/homebrew-mercury
#   brew install Whq02/mercury/mercury
# The sha256 values come from the release's SHA256SUMS.txt.
class Mercury < Formula
  desc "AI coding sessions in your terminal, on the providers you choose"
  homepage "https://mercury-cli.ai"
  version "1.0.0-beta.28"
  license "SEE LICENSE IN https://github.com/Whq02/MercuryCLI/blob/main/LICENSE.md"

  on_macos do
    on_arm do
      url "https://github.com/Whq02/MercuryCLI/releases/download/v1.0.0-beta.28/mercury-v1.0.0-beta.28-macos-arm64.tar.gz"
      sha256 "ea6a8ede32c31bc41c021da6e1239c2635de211ad666e2482e20e6618622e05e"
    end
    on_intel do
      url "https://github.com/Whq02/MercuryCLI/releases/download/v1.0.0-beta.28/mercury-v1.0.0-beta.28-macos-x64.tar.gz"
      sha256 "51fbd3d94e9d50486653ab59ad19b97dcb857351b1a784cd444da4118fe128d6"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/Whq02/MercuryCLI/releases/download/v1.0.0-beta.28/mercury-v1.0.0-beta.28-linux-x64.tar.gz"
      sha256 "6c768e4b499bf5eea4d955530b9dc493f909d7b21385f9d9ef8f4fb61fa77fad"
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
