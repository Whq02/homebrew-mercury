# Homebrew formula for Mercury — the tap is github.com/Whq02/homebrew-mercury
#   brew install Whq02/mercury/mercury
# The sha256 values come from the release's SHA256SUMS.txt.
class Mercury < Formula
  desc "Terminal harness for software development"
  homepage "https://mercury-cli.ai"
  version "1.0.0-beta.3"
  license "SEE LICENSE IN https://github.com/Whq02/MercuryCLI/blob/main/LICENSE.md"

  on_macos do
    on_arm do
      url "https://github.com/Whq02/MercuryCLI/releases/download/v1.0.0-beta.3/mercury-v1.0.0-beta.3-macos-arm64.tar.gz"
      sha256 "9afe0f1199dd2536345516def00c515ab38b8c8538e168bf811c0e6c5575c835"
    end
    on_intel do
      url "https://github.com/Whq02/MercuryCLI/releases/download/v1.0.0-beta.3/mercury-v1.0.0-beta.3-macos-x64.tar.gz"
      sha256 "a042fa58b365bdd176e924ec36dca81397a2eefce03fff07a30e2d3ee84dc0a2"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/Whq02/MercuryCLI/releases/download/v1.0.0-beta.3/mercury-v1.0.0-beta.3-linux-x64.tar.gz"
      sha256 "e65304d9a375ab6d3f46184aee331852c4528948b1beda8cda907b8f71b49178"
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
