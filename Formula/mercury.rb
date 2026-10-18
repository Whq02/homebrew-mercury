# Homebrew formula for Mercury — the tap is github.com/Whq02/homebrew-mercury
#   brew install Whq02/mercury/mercury
# The sha256 values come from the release's SHA256SUMS.txt.
class Mercury < Formula
  desc "AI coding sessions in your terminal, on the providers you choose"
  homepage "https://mercury-cli.ai"
  version "1.0.0-beta.38"
  license "SEE LICENSE IN https://github.com/Whq02/MercuryCLI/blob/main/LICENSE.md"

  on_macos do
    on_arm do
      url "https://github.com/Whq02/MercuryCLI/releases/download/v1.0.0-beta.38/mercury-v1.0.0-beta.38-macos-arm64.tar.gz"
      sha256 "375b6538140aa21a48ed220069445973afac2cc8d1d07ff256ef3e26b1ba71b4"
    end
    on_intel do
      url "https://github.com/Whq02/MercuryCLI/releases/download/v1.0.0-beta.38/mercury-v1.0.0-beta.38-macos-x64.tar.gz"
      sha256 "dcc02c7ab01b969d4a5bf3f7351874a4ebc2bbd1143f49925e4eb13379ec0347"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/Whq02/MercuryCLI/releases/download/v1.0.0-beta.38/mercury-v1.0.0-beta.38-linux-x64.tar.gz"
      sha256 "ec60d26de15f7e0a036ce42124f1e3080f2347bb648d7afe635c47c51f9dde03"
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
