# Homebrew formula for Mercury — the tap is github.com/Whq02/homebrew-mercury
#   brew install Whq02/mercury/mercury
# The sha256 values come from the release's SHA256SUMS.txt.
class Mercury < Formula
  desc "AI coding sessions in your terminal, on the providers you choose"
  homepage "https://mercury-cli.ai"
  version "1.0.0-beta.17"
  license "SEE LICENSE IN https://github.com/Whq02/MercuryCLI/blob/main/LICENSE.md"

  on_macos do
    on_arm do
      url "https://github.com/Whq02/MercuryCLI/releases/download/v1.0.0-beta.17/mercury-v1.0.0-beta.17-macos-arm64.tar.gz"
      sha256 "448f2828f9fb45cd9861ce463c77f422b57d5982a24caa5924696623d37967c8"
    end
    on_intel do
      url "https://github.com/Whq02/MercuryCLI/releases/download/v1.0.0-beta.17/mercury-v1.0.0-beta.17-macos-x64.tar.gz"
      sha256 "1aeba9142fe80494eba6917b6324abdfaf7b5a010a1039a0588efcec2e27696b"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/Whq02/MercuryCLI/releases/download/v1.0.0-beta.17/mercury-v1.0.0-beta.17-linux-x64.tar.gz"
      sha256 "b9f36f18ebb070cf101adff247691e6f55dea11ca28b6733f617f22d9c35607f"
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
