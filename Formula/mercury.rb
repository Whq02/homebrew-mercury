# Homebrew formula for Mercury — the tap is github.com/Whq02/homebrew-mercury
#   brew install Whq02/mercury/mercury
# The sha256 values come from the release's SHA256SUMS.txt.
class Mercury < Formula
  desc "Terminal harness for software development"
  homepage "https://mercury-cli.ai"
  version "1.0.0-beta.13"
  license "SEE LICENSE IN https://github.com/Whq02/MercuryCLI/blob/main/LICENSE.md"

  on_macos do
    on_arm do
      url "https://github.com/Whq02/MercuryCLI/releases/download/v1.0.0-beta.13/mercury-v1.0.0-beta.13-macos-arm64.tar.gz"
      sha256 "f341feb5449dfe86f5f922099b2ee22c73da32602662b47902316a344e09482f"
    end
    on_intel do
      url "https://github.com/Whq02/MercuryCLI/releases/download/v1.0.0-beta.13/mercury-v1.0.0-beta.13-macos-x64.tar.gz"
      sha256 "7893fca1bcd0edc4b9408c3ac537bc35d6a05060780ad2c9d073d367e9ff379c"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/Whq02/MercuryCLI/releases/download/v1.0.0-beta.13/mercury-v1.0.0-beta.13-linux-x64.tar.gz"
      sha256 "bb0028e053fb7b13dae3b43c9a25a3475d5993239a3f9a53851fb05f32be42e8"
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
