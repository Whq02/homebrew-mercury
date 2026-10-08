# Homebrew formula for Mercury — the tap is github.com/Whq02/homebrew-mercury
#   brew install Whq02/mercury/mercury
# The sha256 values come from the release's SHA256SUMS.txt.
class Mercury < Formula
  desc "AI coding sessions in your terminal, on the providers you choose"
  homepage "https://mercury-cli.ai"
  version "1.0.0-beta.29"
  license "SEE LICENSE IN https://github.com/Whq02/MercuryCLI/blob/main/LICENSE.md"

  on_macos do
    on_arm do
      url "https://github.com/Whq02/MercuryCLI/releases/download/v1.0.0-beta.29/mercury-v1.0.0-beta.29-macos-arm64.tar.gz"
      sha256 "1f8b2866eee788a2a22ada628fb22b78aeec0a8ae669bde1c1c73a95744116ed"
    end
    on_intel do
      url "https://github.com/Whq02/MercuryCLI/releases/download/v1.0.0-beta.29/mercury-v1.0.0-beta.29-macos-x64.tar.gz"
      sha256 "e4e313ebeeab9031866721a3c22e53217eae75f1d6f9842b808c42017e17cba8"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/Whq02/MercuryCLI/releases/download/v1.0.0-beta.29/mercury-v1.0.0-beta.29-linux-x64.tar.gz"
      sha256 "b99dec7ce3c99378f3733eb1f3d7d7ea5f398b674b9afaf3646823b05ceb5141"
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
