# Homebrew formula for Mercury — the tap is github.com/Whq02/homebrew-mercury
#   brew install Whq02/mercury/mercury
# The sha256 values come from the release's SHA256SUMS.txt.
class Mercury < Formula
  desc "AI coding sessions in your terminal, on the providers you choose"
  homepage "https://mercury-cli.ai"
  version "1.0.0-beta.37"
  license "SEE LICENSE IN https://github.com/Whq02/MercuryCLI/blob/main/LICENSE.md"

  on_macos do
    on_arm do
      url "https://github.com/Whq02/MercuryCLI/releases/download/v1.0.0-beta.37/mercury-v1.0.0-beta.37-macos-arm64.tar.gz"
      sha256 "50af241c944f8230e1159f74d15efbdf3c08f8c499ca046f13d2b986faf9c90d"
    end
    on_intel do
      url "https://github.com/Whq02/MercuryCLI/releases/download/v1.0.0-beta.37/mercury-v1.0.0-beta.37-macos-x64.tar.gz"
      sha256 "abdb0988396bd35104548cc01d566ef4a72252c7614f50e58bd1e45982f78ca5"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/Whq02/MercuryCLI/releases/download/v1.0.0-beta.37/mercury-v1.0.0-beta.37-linux-x64.tar.gz"
      sha256 "60701a1081dbe12c3e4316d35fab178189b67a45ea78d1bdeaf22aa4fcbf11db"
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
