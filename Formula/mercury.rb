# Homebrew formula for Mercury — the tap is github.com/Whq02/homebrew-mercury
#   brew install Whq02/mercury/mercury
# The sha256 values come from the release's SHA256SUMS.txt.
class Mercury < Formula
  desc "AI coding sessions in your terminal, on the providers you choose"
  homepage "https://mercury-cli.ai"
  version "1.0.2"
  license "SEE LICENSE IN https://github.com/Whq02/MercuryCLI/blob/main/LICENSE.md"

  on_macos do
    on_arm do
      url "https://github.com/Whq02/MercuryCLI/releases/download/v1.0.2/mercury-v1.0.2-macos-arm64.tar.gz"
      sha256 "57a0437a959914a9336af0432c13ed4308ded64a4c5c2322540199be97d9b7a0"
    end
    on_intel do
      url "https://github.com/Whq02/MercuryCLI/releases/download/v1.0.2/mercury-v1.0.2-macos-x64.tar.gz"
      sha256 "1fb4e8bfec57b087627673b3d66ff13b104ab136989b890fb022b468919f1863"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/Whq02/MercuryCLI/releases/download/v1.0.2/mercury-v1.0.2-linux-x64.tar.gz"
      sha256 "3a2286e7cab38d9658ae3b2cd0fa3e6183e63d5d6791acb59357c733624bc322"
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
