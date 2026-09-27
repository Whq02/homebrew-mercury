# Homebrew formula for Mercury — the tap is github.com/Whq02/homebrew-mercury
#   brew install Whq02/mercury/mercury
# The sha256 values come from the release's SHA256SUMS.txt.
class Mercury < Formula
  desc "AI coding sessions in your terminal, on the providers you choose"
  homepage "https://mercury-cli.ai"
  version "1.0.0-beta.22"
  license "SEE LICENSE IN https://github.com/Whq02/MercuryCLI/blob/main/LICENSE.md"

  on_macos do
    on_arm do
      url "https://github.com/Whq02/MercuryCLI/releases/download/v1.0.0-beta.22/mercury-v1.0.0-beta.22-macos-arm64.tar.gz"
      sha256 "1752a5a019bcbd69ac3f4eb144b6c832412bb0081031992f10fbefda58bfc247"
    end
    on_intel do
      url "https://github.com/Whq02/MercuryCLI/releases/download/v1.0.0-beta.22/mercury-v1.0.0-beta.22-macos-x64.tar.gz"
      sha256 "e953b0a5b8308bd692a2f63c61902d4d08f9be9acd304c19b8846eb16e655023"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/Whq02/MercuryCLI/releases/download/v1.0.0-beta.22/mercury-v1.0.0-beta.22-linux-x64.tar.gz"
      sha256 "59076f39f3b1266570a9c6bb29a2105702bf823d5a4037b63270ff4ca1c935cf"
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
