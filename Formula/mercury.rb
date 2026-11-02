# Homebrew formula for Mercury — the tap is github.com/Whq02/homebrew-mercury
#   brew install Whq02/mercury/mercury
# The sha256 values come from the release's SHA256SUMS.txt.
class Mercury < Formula
  desc "AI coding sessions in your terminal, on the providers you choose"
  homepage "https://mercury-cli.ai"
  version "1.0.3"
  license "SEE LICENSE IN https://github.com/Whq02/MercuryCLI/blob/main/LICENSE.md"

  on_macos do
    on_arm do
      url "https://github.com/Whq02/MercuryCLI/releases/download/v1.0.3/mercury-v1.0.3-macos-arm64.tar.gz"
      sha256 "a7a00a7324fa88fb1db1e302652263091d256bfb7fa68895e5408165d0de545d"
    end
    on_intel do
      url "https://github.com/Whq02/MercuryCLI/releases/download/v1.0.3/mercury-v1.0.3-macos-x64.tar.gz"
      sha256 "b04e3709086547f18baeb953e9d44d6921300e15f791c733e82da5a865c5bb6f"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/Whq02/MercuryCLI/releases/download/v1.0.3/mercury-v1.0.3-linux-x64.tar.gz"
      sha256 "0aae2af587d941a112bb1242ffcd5d737a552117c5a40887f6eab721770ff380"
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
