# Homebrew formula for Mercury — the tap is github.com/Whq02/homebrew-mercury
#   brew install Whq02/mercury/mercury
# The sha256 values come from the release's SHA256SUMS.txt.
class Mercury < Formula
  desc "AI coding sessions in your terminal, on the providers you choose"
  homepage "https://mercury-cli.ai"
  version "1.0.0"
  license "SEE LICENSE IN https://github.com/Whq02/MercuryCLI/blob/main/LICENSE.md"

  on_macos do
    on_arm do
      url "https://github.com/Whq02/MercuryCLI/releases/download/v1.0.0/mercury-v1.0.0-macos-arm64.tar.gz"
      sha256 "fc9c7f1de2a7d75902ac2d10fcad20dea6b2baeda81daa6dea224deb0c3474f6"
    end
    on_intel do
      url "https://github.com/Whq02/MercuryCLI/releases/download/v1.0.0/mercury-v1.0.0-macos-x64.tar.gz"
      sha256 "2e350bedba3d277a20f523ef6ee10dd1b4bfd6343f5d466ced4d3696e3fd299e"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/Whq02/MercuryCLI/releases/download/v1.0.0/mercury-v1.0.0-linux-x64.tar.gz"
      sha256 "9e19dddfde8845215c628519ddae1952356f303069c77feeb68243619d6c5159"
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
