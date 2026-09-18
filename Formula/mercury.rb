# Homebrew formula for Mercury — the tap is github.com/Whq02/homebrew-mercury
#   brew install Whq02/mercury/mercury
# The sha256 values come from the release's SHA256SUMS.txt.
class Mercury < Formula
  desc "Terminal harness for software development"
  homepage "https://mercury-cli.ai"
  version "1.0.0-beta.14"
  license "SEE LICENSE IN https://github.com/Whq02/MercuryCLI/blob/main/LICENSE.md"

  on_macos do
    on_arm do
      url "https://github.com/Whq02/MercuryCLI/releases/download/v1.0.0-beta.14/mercury-v1.0.0-beta.14-macos-arm64.tar.gz"
      sha256 "a83c5e9b27ac4ce6b6ee0f0c0a95698152d1301e027e971b923a6ff9758c1c83"
    end
    on_intel do
      url "https://github.com/Whq02/MercuryCLI/releases/download/v1.0.0-beta.14/mercury-v1.0.0-beta.14-macos-x64.tar.gz"
      sha256 "7bcc91be06a6e432875520d64f815c321fd5c2b658a1989e10f52ede00777bef"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/Whq02/MercuryCLI/releases/download/v1.0.0-beta.14/mercury-v1.0.0-beta.14-linux-x64.tar.gz"
      sha256 "99ab34def99ce76cbf58c0b8df9dd698261ee5acff4c197f041c3ba556247c73"
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
