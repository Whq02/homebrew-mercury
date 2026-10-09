# Homebrew formula for Mercury — the tap is github.com/Whq02/homebrew-mercury
#   brew install Whq02/mercury/mercury
# The sha256 values come from the release's SHA256SUMS.txt.
class Mercury < Formula
  desc "AI coding sessions in your terminal, on the providers you choose"
  homepage "https://mercury-cli.ai"
  version "1.0.0-beta.30"
  license "SEE LICENSE IN https://github.com/Whq02/MercuryCLI/blob/main/LICENSE.md"

  on_macos do
    on_arm do
      url "https://github.com/Whq02/MercuryCLI/releases/download/v1.0.0-beta.30/mercury-v1.0.0-beta.30-macos-arm64.tar.gz"
      sha256 "7ebfaf9e5d32c4f5f3d8288fada1e6db7d3f7fa54116f8525c8a43803b5b2778"
    end
    on_intel do
      url "https://github.com/Whq02/MercuryCLI/releases/download/v1.0.0-beta.30/mercury-v1.0.0-beta.30-macos-x64.tar.gz"
      sha256 "04dd1bbed0ee0ecf20fb500cef415883e44b6c38859e4af6203ef9fc41e451c6"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/Whq02/MercuryCLI/releases/download/v1.0.0-beta.30/mercury-v1.0.0-beta.30-linux-x64.tar.gz"
      sha256 "b597e7626bdfb0d405e9a93dedcd67a4e918faaa7d68fb18003f5c305b819492"
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
