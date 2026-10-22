# Homebrew formula for Mercury — the tap is github.com/Whq02/homebrew-mercury
#   brew install Whq02/mercury/mercury
# The sha256 values come from the release's SHA256SUMS.txt.
class Mercury < Formula
  desc "AI coding sessions in your terminal, on the providers you choose"
  homepage "https://mercury-cli.ai"
  version "1.0.0-beta.41"
  license "SEE LICENSE IN https://github.com/Whq02/MercuryCLI/blob/main/LICENSE.md"

  on_macos do
    on_arm do
      url "https://github.com/Whq02/MercuryCLI/releases/download/v1.0.0-beta.41/mercury-v1.0.0-beta.41-macos-arm64.tar.gz"
      sha256 "77d484d2b68cae59d2af8eccb57d07edb2a3e0e237e52cdab48074bf692e1fe7"
    end
    on_intel do
      url "https://github.com/Whq02/MercuryCLI/releases/download/v1.0.0-beta.41/mercury-v1.0.0-beta.41-macos-x64.tar.gz"
      sha256 "b06c88120431de3368bc46a554dd464d3524d26cd25d74e9c3a15dbe4af73f08"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/Whq02/MercuryCLI/releases/download/v1.0.0-beta.41/mercury-v1.0.0-beta.41-linux-x64.tar.gz"
      sha256 "530dacfcc19f36114669a130fb3e6780b0dbbaa73d9883fd44f4907b48fe5de0"
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
