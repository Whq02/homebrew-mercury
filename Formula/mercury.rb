# Homebrew formula for Mercury — the tap is github.com/Whq02/homebrew-mercury
#   brew install Whq02/mercury/mercury
# The sha256 values come from the release's SHA256SUMS.txt.
class Mercury < Formula
  desc "Terminal harness for software development"
  homepage "https://mercury-cli.ai"
  version "1.0.0-beta.12"
  license "SEE LICENSE IN https://github.com/Whq02/MercuryCLI/blob/main/LICENSE.md"

  on_macos do
    on_arm do
      url "https://github.com/Whq02/MercuryCLI/releases/download/v1.0.0-beta.12/mercury-v1.0.0-beta.12-macos-arm64.tar.gz"
      sha256 "b2419a12524cefac8fa6bcd60cdfc98927ad7fd8a7feba82f018270534328505"
    end
    on_intel do
      url "https://github.com/Whq02/MercuryCLI/releases/download/v1.0.0-beta.12/mercury-v1.0.0-beta.12-macos-x64.tar.gz"
      sha256 "29cd983b52116eb64e7d47826def87d983e250fd359ebadd6e8e99c35ace5d88"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/Whq02/MercuryCLI/releases/download/v1.0.0-beta.12/mercury-v1.0.0-beta.12-linux-x64.tar.gz"
      sha256 "600011e4086e7726c0ccd7996ba520d20b6600d3370c1411d2e80b523995d59a"
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
