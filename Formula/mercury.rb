# Homebrew formula for Mercury — the tap is github.com/Whq02/homebrew-mercury
#   brew install Whq02/mercury/mercury
# The sha256 values come from the release's SHA256SUMS.txt.
class Mercury < Formula
  desc "AI coding sessions in your terminal, on the providers you choose"
  homepage "https://mercury-cli.ai"
  version "1.0.4"
  license "SEE LICENSE IN https://github.com/Whq02/MercuryCLI/blob/main/LICENSE.md"

  on_macos do
    on_arm do
      url "https://github.com/Whq02/MercuryCLI/releases/download/v1.0.4/mercury-v1.0.4-macos-arm64.tar.gz"
      sha256 "6e841f2a8b0e41eecfba3ded262d789203e31ff41519dfbf3f94db9f7b474541"
    end
    on_intel do
      url "https://github.com/Whq02/MercuryCLI/releases/download/v1.0.4/mercury-v1.0.4-macos-x64.tar.gz"
      sha256 "0f1eb35492ef012e3611ee77b1b0e0a72782b51c6df73438d1d24da4c48f5159"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/Whq02/MercuryCLI/releases/download/v1.0.4/mercury-v1.0.4-linux-x64.tar.gz"
      sha256 "68e4f188c8bf41cf902353a7f218b60c11d954a9c46d2dba51e284b07d2525a1"
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
