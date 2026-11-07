# Homebrew formula for Mercury — the tap is github.com/Whq02/homebrew-mercury
#   brew install Whq02/mercury/mercury
# The sha256 values come from the release's SHA256SUMS.txt.
class Mercury < Formula
  desc "AI coding sessions in your terminal, on the providers you choose"
  homepage "https://mercury-cli.ai"
  version "1.0.7"
  license "SEE LICENSE IN https://github.com/Whq02/MercuryCLI/blob/main/LICENSE.md"

  on_macos do
    on_arm do
      url "https://github.com/Whq02/MercuryCLI/releases/download/v1.0.7/mercury-v1.0.7-macos-arm64.tar.gz"
      sha256 "77f2ef0dbfafddc4770ffb4f3444468f4043b391c1b816a7179f74bb8e4e716f"
    end
    on_intel do
      url "https://github.com/Whq02/MercuryCLI/releases/download/v1.0.7/mercury-v1.0.7-macos-x64.tar.gz"
      sha256 "759cdb5c696fde1f830e8093199b2c747d48ded2a6cbb567728a83d4fcbc3af2"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/Whq02/MercuryCLI/releases/download/v1.0.7/mercury-v1.0.7-linux-x64.tar.gz"
      sha256 "232aae51170381814d900970c2bf3db30fd129d650d014de89e72764f226694e"
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
