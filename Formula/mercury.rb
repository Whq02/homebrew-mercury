# Homebrew formula for Mercury — the tap is github.com/Whq02/homebrew-mercury
#   brew install Whq02/mercury/mercury
# The sha256 values come from the release's SHA256SUMS.txt.
class Mercury < Formula
  desc "AI coding sessions in your terminal, on the providers you choose"
  homepage "https://mercury-cli.ai"
  version "1.0.0-beta.24"
  license "SEE LICENSE IN https://github.com/Whq02/MercuryCLI/blob/main/LICENSE.md"

  on_macos do
    on_arm do
      url "https://github.com/Whq02/MercuryCLI/releases/download/v1.0.0-beta.24/mercury-v1.0.0-beta.24-macos-arm64.tar.gz"
      sha256 "5ae9c2a71dc45c69eeb3131999aafb95b191027d3bd38f1f9291cb01eef4c221"
    end
    on_intel do
      url "https://github.com/Whq02/MercuryCLI/releases/download/v1.0.0-beta.24/mercury-v1.0.0-beta.24-macos-x64.tar.gz"
      sha256 "daab1375608666fd0df9b5d912b9491c110c709f15b6aff76224232b20af980c"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/Whq02/MercuryCLI/releases/download/v1.0.0-beta.24/mercury-v1.0.0-beta.24-linux-x64.tar.gz"
      sha256 "717250b04f14c59c7d6fb1556546cd58a7a197f843c8fa02870119bb243f9a38"
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
