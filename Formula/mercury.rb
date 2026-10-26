# Homebrew formula for Mercury — the tap is github.com/Whq02/homebrew-mercury
#   brew install Whq02/mercury/mercury
# The sha256 values come from the release's SHA256SUMS.txt.
class Mercury < Formula
  desc "AI coding sessions in your terminal, on the providers you choose"
  homepage "https://mercury-cli.ai"
  version "1.0.0-beta.44"
  license "SEE LICENSE IN https://github.com/Whq02/MercuryCLI/blob/main/LICENSE.md"

  on_macos do
    on_arm do
      url "https://github.com/Whq02/MercuryCLI/releases/download/v1.0.0-beta.44/mercury-v1.0.0-beta.44-macos-arm64.tar.gz"
      sha256 "3ed772a2ee06648b5097c774c6ff021635fb96ace590e487bb5c86f941ddf7e2"
    end
    on_intel do
      url "https://github.com/Whq02/MercuryCLI/releases/download/v1.0.0-beta.44/mercury-v1.0.0-beta.44-macos-x64.tar.gz"
      sha256 "152c3dda66b7bdb0880d4c957099d04355b539edea128ab971201e50ae116aa7"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/Whq02/MercuryCLI/releases/download/v1.0.0-beta.44/mercury-v1.0.0-beta.44-linux-x64.tar.gz"
      sha256 "56c6caa1c27886fd0bd9c4501719eb28e66a62d0a8b18f8c688c33c348b67c07"
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
