# Homebrew formula for Mercury — the tap is github.com/Whq02/homebrew-mercury
#   brew install Whq02/mercury/mercury
# The sha256 values come from the release's SHA256SUMS.txt.
class Mercury < Formula
  desc "Terminal harness for software development"
  homepage "https://mercury-cli.ai"
  version "1.0.0-beta.8"
  license "SEE LICENSE IN https://github.com/Whq02/MercuryCLI/blob/main/LICENSE.md"

  on_macos do
    on_arm do
      url "https://github.com/Whq02/MercuryCLI/releases/download/v1.0.0-beta.8/mercury-v1.0.0-beta.8-macos-arm64.tar.gz"
      sha256 "05839edf0a90635b181d4f1a0c71a017a83d0fa16b8f65c5e7481cf36809b95e"
    end
    on_intel do
      url "https://github.com/Whq02/MercuryCLI/releases/download/v1.0.0-beta.8/mercury-v1.0.0-beta.8-macos-x64.tar.gz"
      sha256 "10eb5bf0caa5eaa14b0fb61e7a950b38a77dd13410e848babc8304cc0bed4f68"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/Whq02/MercuryCLI/releases/download/v1.0.0-beta.8/mercury-v1.0.0-beta.8-linux-x64.tar.gz"
      sha256 "6ca642b20fad84487c29a90b4271e0ef50a835bd15e21bf316003c761f1291d5"
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
