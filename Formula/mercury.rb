# Homebrew formula for Mercury — the tap is github.com/Whq02/homebrew-mercury
#   brew install Whq02/mercury/mercury
# The sha256 values come from the release's SHA256SUMS.txt.
class Mercury < Formula
  desc "AI coding sessions in your terminal, on the providers you choose"
  homepage "https://mercury-cli.ai"
  version "1.0.0-beta.16"
  license "SEE LICENSE IN https://github.com/Whq02/MercuryCLI/blob/main/LICENSE.md"

  on_macos do
    on_arm do
      url "https://github.com/Whq02/MercuryCLI/releases/download/v1.0.0-beta.16/mercury-v1.0.0-beta.16-macos-arm64.tar.gz"
      sha256 "02e0422f15287b344627dc612cc5dacdc29cb1d3fc743287d79598a13ffc48d6"
    end
    on_intel do
      url "https://github.com/Whq02/MercuryCLI/releases/download/v1.0.0-beta.16/mercury-v1.0.0-beta.16-macos-x64.tar.gz"
      sha256 "a349e8d2f14f7327bd8f4039ff8c397db457f088467a99e13e5ae85725802dfe"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/Whq02/MercuryCLI/releases/download/v1.0.0-beta.16/mercury-v1.0.0-beta.16-linux-x64.tar.gz"
      sha256 "ab9be0af310ff537d375e15c7c982ae4c821d5697fdd64141f6d98b0bc83a51c"
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
