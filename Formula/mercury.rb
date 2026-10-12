# Homebrew formula for Mercury — the tap is github.com/Whq02/homebrew-mercury
#   brew install Whq02/mercury/mercury
# The sha256 values come from the release's SHA256SUMS.txt.
class Mercury < Formula
  desc "AI coding sessions in your terminal, on the providers you choose"
  homepage "https://mercury-cli.ai"
  version "1.0.0-beta.33"
  license "SEE LICENSE IN https://github.com/Whq02/MercuryCLI/blob/main/LICENSE.md"

  on_macos do
    on_arm do
      url "https://github.com/Whq02/MercuryCLI/releases/download/v1.0.0-beta.33/mercury-v1.0.0-beta.33-macos-arm64.tar.gz"
      sha256 "f65277d1997c9331b4a3e7ea71042a241044f25895d62db351f3b8b9cd53836a"
    end
    on_intel do
      url "https://github.com/Whq02/MercuryCLI/releases/download/v1.0.0-beta.33/mercury-v1.0.0-beta.33-macos-x64.tar.gz"
      sha256 "c4b2278170cfa4a4d80ed2f548c7f880464508c276a2e88cc3716f30a4ed3a0e"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/Whq02/MercuryCLI/releases/download/v1.0.0-beta.33/mercury-v1.0.0-beta.33-linux-x64.tar.gz"
      sha256 "e0d8cef157284c70100bca5b4c056a4dbbfbeef9ec394623bc703df35703dec6"
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
