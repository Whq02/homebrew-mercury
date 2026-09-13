# Homebrew formula for Mercury — the tap is github.com/Whq02/homebrew-mercury
#   brew install Whq02/mercury/mercury
# The sha256 values come from the release's SHA256SUMS.txt.
class Mercury < Formula
  desc "Terminal harness for software development"
  homepage "https://mercury-cli.ai"
  version "1.0.0-beta.11"
  license "SEE LICENSE IN https://github.com/Whq02/MercuryCLI/blob/main/LICENSE.md"

  on_macos do
    on_arm do
      url "https://github.com/Whq02/MercuryCLI/releases/download/v1.0.0-beta.11/mercury-v1.0.0-beta.11-macos-arm64.tar.gz"
      sha256 "9e4adf1b7bc894500d86b23fa04b0fb3bf7ba7b4e5f0c20a0ba775e132831555"
    end
    on_intel do
      url "https://github.com/Whq02/MercuryCLI/releases/download/v1.0.0-beta.11/mercury-v1.0.0-beta.11-macos-x64.tar.gz"
      sha256 "14630b594ee23eca36d10766fd7da7981fa70260b81dcb9e057166ab5965baac"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/Whq02/MercuryCLI/releases/download/v1.0.0-beta.11/mercury-v1.0.0-beta.11-linux-x64.tar.gz"
      sha256 "4b03f6fa703b032880265bfbe40e83c568422df3528f6d3e0ca67064a357e087"
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
