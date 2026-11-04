# Homebrew formula for Mercury — the tap is github.com/Whq02/homebrew-mercury
#   brew install Whq02/mercury/mercury
# The sha256 values come from the release's SHA256SUMS.txt.
class Mercury < Formula
  desc "AI coding sessions in your terminal, on the providers you choose"
  homepage "https://mercury-cli.ai"
  version "1.0.5"
  license "SEE LICENSE IN https://github.com/Whq02/MercuryCLI/blob/main/LICENSE.md"

  on_macos do
    on_arm do
      url "https://github.com/Whq02/MercuryCLI/releases/download/v1.0.5/mercury-v1.0.5-macos-arm64.tar.gz"
      sha256 "c0c7c506f6033b5bf485e01befda47792df8244e41f033959572551f43a2ef2b"
    end
    on_intel do
      url "https://github.com/Whq02/MercuryCLI/releases/download/v1.0.5/mercury-v1.0.5-macos-x64.tar.gz"
      sha256 "035c6afd1cd6826ad12d2243e02ea6da82a7707c3636379455f6dc1cdbe5504a"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/Whq02/MercuryCLI/releases/download/v1.0.5/mercury-v1.0.5-linux-x64.tar.gz"
      sha256 "ca428e6172664514ad1c4b70b9dde594ff1355d32ae5c0cf6b7191cd364b518c"
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
