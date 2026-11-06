# Homebrew formula for Mercury — the tap is github.com/Whq02/homebrew-mercury
#   brew install Whq02/mercury/mercury
# The sha256 values come from the release's SHA256SUMS.txt.
class Mercury < Formula
  desc "AI coding sessions in your terminal, on the providers you choose"
  homepage "https://mercury-cli.ai"
  version "1.0.6"
  license "SEE LICENSE IN https://github.com/Whq02/MercuryCLI/blob/main/LICENSE.md"

  on_macos do
    on_arm do
      url "https://github.com/Whq02/MercuryCLI/releases/download/v1.0.6/mercury-v1.0.6-macos-arm64.tar.gz"
      sha256 "77c7febfadf1cadde198f1e79f3fdc2284c890a1927077b4aff54b1500cbcbc7"
    end
    on_intel do
      url "https://github.com/Whq02/MercuryCLI/releases/download/v1.0.6/mercury-v1.0.6-macos-x64.tar.gz"
      sha256 "7d40ab1572678d73a3412341fb14876ae33da23929337f5bd7069e0e234b4c92"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/Whq02/MercuryCLI/releases/download/v1.0.6/mercury-v1.0.6-linux-x64.tar.gz"
      sha256 "165cc3298f0d872ec6a24220b4dcf2d1f8883c5ece7fcc8e270842d6f6974602"
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
