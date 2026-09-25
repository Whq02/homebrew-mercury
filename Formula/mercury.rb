# Homebrew formula for Mercury — the tap is github.com/Whq02/homebrew-mercury
#   brew install Whq02/mercury/mercury
# The sha256 values come from the release's SHA256SUMS.txt.
class Mercury < Formula
  desc "AI coding sessions in your terminal, on the providers you choose"
  homepage "https://mercury-cli.ai"
  version "1.0.0-beta.20"
  license "SEE LICENSE IN https://github.com/Whq02/MercuryCLI/blob/main/LICENSE.md"

  on_macos do
    on_arm do
      url "https://github.com/Whq02/MercuryCLI/releases/download/v1.0.0-beta.20/mercury-v1.0.0-beta.20-macos-arm64.tar.gz"
      sha256 "383423d448c82352995471ba27b673250f5ca89f42016ba74e0ad1195f66f04c"
    end
    on_intel do
      url "https://github.com/Whq02/MercuryCLI/releases/download/v1.0.0-beta.20/mercury-v1.0.0-beta.20-macos-x64.tar.gz"
      sha256 "8469ee1fad921ec896f956c9f6ee613395be4985a54dae9e1d7feb167a7d64f1"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/Whq02/MercuryCLI/releases/download/v1.0.0-beta.20/mercury-v1.0.0-beta.20-linux-x64.tar.gz"
      sha256 "1522427764bdc240b1e3552f3207731f27ec81cc2043681bc8cb9855a75785d6"
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
