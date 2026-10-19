# Homebrew formula for Mercury — the tap is github.com/Whq02/homebrew-mercury
#   brew install Whq02/mercury/mercury
# The sha256 values come from the release's SHA256SUMS.txt.
class Mercury < Formula
  desc "AI coding sessions in your terminal, on the providers you choose"
  homepage "https://mercury-cli.ai"
  version "1.0.0-beta.39"
  license "SEE LICENSE IN https://github.com/Whq02/MercuryCLI/blob/main/LICENSE.md"

  on_macos do
    on_arm do
      url "https://github.com/Whq02/MercuryCLI/releases/download/v1.0.0-beta.39/mercury-v1.0.0-beta.39-macos-arm64.tar.gz"
      sha256 "18f4463facb1cd2711ba45205e24c954f3ff98632730b4ab8477e000e104c190"
    end
    on_intel do
      url "https://github.com/Whq02/MercuryCLI/releases/download/v1.0.0-beta.39/mercury-v1.0.0-beta.39-macos-x64.tar.gz"
      sha256 "5c14ffccfc03c3e3bc3791b8e125164adc641082b59a60073ccd080be579b871"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/Whq02/MercuryCLI/releases/download/v1.0.0-beta.39/mercury-v1.0.0-beta.39-linux-x64.tar.gz"
      sha256 "1a7c9e7a651f1ed3474709a6709dec2b59e7c33eb788b6204bc7af36c1cf7d3e"
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
