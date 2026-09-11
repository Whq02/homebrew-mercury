# Homebrew formula for Mercury — the tap is github.com/Whq02/homebrew-mercury
#   brew install Whq02/mercury/mercury
# The sha256 values come from the release's SHA256SUMS.txt.
class Mercury < Formula
  desc "Terminal harness for software development"
  homepage "https://mercury-cli.ai"
  version "1.0.0-beta.6"
  license "SEE LICENSE IN https://github.com/Whq02/MercuryCLI/blob/main/LICENSE.md"

  on_macos do
    on_arm do
      url "https://github.com/Whq02/MercuryCLI/releases/download/v1.0.0-beta.6/mercury-v1.0.0-beta.6-macos-arm64.tar.gz"
      sha256 "e5479ff3ae88918fd90080bd48b7d2381e91eaf142b09037e9f5d759a1e99540"
    end
    on_intel do
      url "https://github.com/Whq02/MercuryCLI/releases/download/v1.0.0-beta.6/mercury-v1.0.0-beta.6-macos-x64.tar.gz"
      sha256 "328cce6651e21e720d0326351cf8ef45aa6e1e5b59383345c990f82f90403455"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/Whq02/MercuryCLI/releases/download/v1.0.0-beta.6/mercury-v1.0.0-beta.6-linux-x64.tar.gz"
      sha256 "0764c75fd848abb72bd1a5c7e5c9bef3d31016dcf9e89bca164460ffb8670bfe"
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
