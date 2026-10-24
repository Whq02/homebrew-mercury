# Homebrew formula for Mercury — the tap is github.com/Whq02/homebrew-mercury
#   brew install Whq02/mercury/mercury
# The sha256 values come from the release's SHA256SUMS.txt.
class Mercury < Formula
  desc "AI coding sessions in your terminal, on the providers you choose"
  homepage "https://mercury-cli.ai"
  version "1.0.0-beta.43"
  license "SEE LICENSE IN https://github.com/Whq02/MercuryCLI/blob/main/LICENSE.md"

  on_macos do
    on_arm do
      url "https://github.com/Whq02/MercuryCLI/releases/download/v1.0.0-beta.43/mercury-v1.0.0-beta.43-macos-arm64.tar.gz"
      sha256 "e7a432c42a45cbe19caf2c8c94fa64352dd8f4749bcc7fc6af122e09537a98ff"
    end
    on_intel do
      url "https://github.com/Whq02/MercuryCLI/releases/download/v1.0.0-beta.43/mercury-v1.0.0-beta.43-macos-x64.tar.gz"
      sha256 "876dafd6ae8f6225d8fa076a19d7531bdf2b34a599563d03672688c2351a655b"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/Whq02/MercuryCLI/releases/download/v1.0.0-beta.43/mercury-v1.0.0-beta.43-linux-x64.tar.gz"
      sha256 "1ffd495810b3bcebcb004aeb5db99d1f676f70ca43e4ec24ccc5dd210bce1c51"
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
