# Homebrew formula for Mercury — the tap is github.com/Whq02/homebrew-mercury
#   brew install Whq02/mercury/mercury
# The sha256 values come from the release's SHA256SUMS.txt.
class Mercury < Formula
  desc "AI coding sessions in your terminal, on the providers you choose"
  homepage "https://mercury-cli.ai"
  version "1.0.0-beta.25"
  license "SEE LICENSE IN https://github.com/Whq02/MercuryCLI/blob/main/LICENSE.md"

  on_macos do
    on_arm do
      url "https://github.com/Whq02/MercuryCLI/releases/download/v1.0.0-beta.25/mercury-v1.0.0-beta.25-macos-arm64.tar.gz"
      sha256 "38bfc593b54a4c4a14748b63c02c6ca7d61762ea5976f91c74644e4b96e734a9"
    end
    on_intel do
      url "https://github.com/Whq02/MercuryCLI/releases/download/v1.0.0-beta.25/mercury-v1.0.0-beta.25-macos-x64.tar.gz"
      sha256 "3eeed7255adc49ad16b83c7dacc1c7f6ddca7eacbd29e7452e5a3fd64c2c5291"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/Whq02/MercuryCLI/releases/download/v1.0.0-beta.25/mercury-v1.0.0-beta.25-linux-x64.tar.gz"
      sha256 "9a94e923fba2844e77e769c1f0d799dcdeb3fddb98daa99a9dca04eab5b93e64"
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
