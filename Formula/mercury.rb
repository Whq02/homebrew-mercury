# Homebrew formula for Mercury — the tap is github.com/Whq02/homebrew-mercury
#   brew install Whq02/mercury/mercury
# The sha256 values come from the release's SHA256SUMS.txt.
class Mercury < Formula
  desc "AI coding sessions in your terminal, on the providers you choose"
  homepage "https://mercury-cli.ai"
  version "1.0.0-beta.19"
  license "SEE LICENSE IN https://github.com/Whq02/MercuryCLI/blob/main/LICENSE.md"

  on_macos do
    on_arm do
      url "https://github.com/Whq02/MercuryCLI/releases/download/v1.0.0-beta.19/mercury-v1.0.0-beta.19-macos-arm64.tar.gz"
      sha256 "5ba87a0804aa046c7761c2d08dd152d5987f7a88f591f5dbb9e769d4858af871"
    end
    on_intel do
      url "https://github.com/Whq02/MercuryCLI/releases/download/v1.0.0-beta.19/mercury-v1.0.0-beta.19-macos-x64.tar.gz"
      sha256 "f5f1df1c75d22e913f6cea1d93cbcb083a57ab4514d342df35935a0c305b7808"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/Whq02/MercuryCLI/releases/download/v1.0.0-beta.19/mercury-v1.0.0-beta.19-linux-x64.tar.gz"
      sha256 "34c60a9a2a1eea21b196a4c362e8c284656db5a7133662b8bb2fae7670e6929e"
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
