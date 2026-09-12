# Homebrew formula for Mercury — the tap is github.com/Whq02/homebrew-mercury
#   brew install Whq02/mercury/mercury
# The sha256 values come from the release's SHA256SUMS.txt.
class Mercury < Formula
  desc "Terminal harness for software development"
  homepage "https://mercury-cli.ai"
  version "1.0.0-beta.7"
  license "SEE LICENSE IN https://github.com/Whq02/MercuryCLI/blob/main/LICENSE.md"

  on_macos do
    on_arm do
      url "https://github.com/Whq02/MercuryCLI/releases/download/v1.0.0-beta.7/mercury-v1.0.0-beta.7-macos-arm64.tar.gz"
      sha256 "55ffcd5006ff607dc6cb034f4f7752564ccd2eff1c1320206d12de642ea56c76"
    end
    on_intel do
      url "https://github.com/Whq02/MercuryCLI/releases/download/v1.0.0-beta.7/mercury-v1.0.0-beta.7-macos-x64.tar.gz"
      sha256 "e6657916b340b174570d37af6b02fc8d12503555a840bcce4d2e6f17f32731c7"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/Whq02/MercuryCLI/releases/download/v1.0.0-beta.7/mercury-v1.0.0-beta.7-linux-x64.tar.gz"
      sha256 "1f2a274fa623c4ad0284eaad810909b1e85864c25885ecd09d56a5c257e79628"
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
