# Homebrew formula for Mercury — the tap is github.com/Whq02/homebrew-mercury
#   brew install Whq02/mercury/mercury
# The sha256 values come from the release's SHA256SUMS.txt.
class Mercury < Formula
  desc "AI coding sessions in your terminal, on the providers you choose"
  homepage "https://mercury-cli.ai"
  version "1.0.0-beta.26"
  license "SEE LICENSE IN https://github.com/Whq02/MercuryCLI/blob/main/LICENSE.md"

  on_macos do
    on_arm do
      url "https://github.com/Whq02/MercuryCLI/releases/download/v1.0.0-beta.26/mercury-v1.0.0-beta.26-macos-arm64.tar.gz"
      sha256 "c3e90373b2b9cb0307137ee43c1bd18a5c1fc98d26964ccee816fb6bb1a77856"
    end
    on_intel do
      url "https://github.com/Whq02/MercuryCLI/releases/download/v1.0.0-beta.26/mercury-v1.0.0-beta.26-macos-x64.tar.gz"
      sha256 "ceea65bec6e04988a06c5879f30ee4da42222fcdcb84bf1dcf6e0ab7e65ce78e"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/Whq02/MercuryCLI/releases/download/v1.0.0-beta.26/mercury-v1.0.0-beta.26-linux-x64.tar.gz"
      sha256 "16370928344defdc3e347abfebcd1ad64dc19adfa93b4fc371e7389f9abfa9b2"
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
