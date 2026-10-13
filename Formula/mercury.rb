# Homebrew formula for Mercury — the tap is github.com/Whq02/homebrew-mercury
#   brew install Whq02/mercury/mercury
# The sha256 values come from the release's SHA256SUMS.txt.
class Mercury < Formula
  desc "AI coding sessions in your terminal, on the providers you choose"
  homepage "https://mercury-cli.ai"
  version "1.0.0-beta.34"
  license "SEE LICENSE IN https://github.com/Whq02/MercuryCLI/blob/main/LICENSE.md"

  on_macos do
    on_arm do
      url "https://github.com/Whq02/MercuryCLI/releases/download/v1.0.0-beta.34/mercury-v1.0.0-beta.34-macos-arm64.tar.gz"
      sha256 "8ab5d99219db68aab8c327c33107da8ad2034c76188c031c67ca1bcda56db205"
    end
    on_intel do
      url "https://github.com/Whq02/MercuryCLI/releases/download/v1.0.0-beta.34/mercury-v1.0.0-beta.34-macos-x64.tar.gz"
      sha256 "31401878dbde1a5641b42b9c408fbad72772ff60e218ee250391ee0523d4a515"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/Whq02/MercuryCLI/releases/download/v1.0.0-beta.34/mercury-v1.0.0-beta.34-linux-x64.tar.gz"
      sha256 "a3c9a3a0e26ca96fbae9a4d1bb389b8fcf7f860704c1556d23e308cd8f93dc6c"
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
