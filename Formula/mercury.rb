# Homebrew formula for Mercury — the tap is github.com/Whq02/homebrew-mercury
#   brew install Whq02/mercury/mercury
# The sha256 values come from the release's SHA256SUMS.txt.
class Mercury < Formula
  desc "AI coding sessions in your terminal, on the providers you choose"
  homepage "https://mercury-cli.ai"
  version "1.0.0-beta.42"
  license "SEE LICENSE IN https://github.com/Whq02/MercuryCLI/blob/main/LICENSE.md"

  on_macos do
    on_arm do
      url "https://github.com/Whq02/MercuryCLI/releases/download/v1.0.0-beta.42/mercury-v1.0.0-beta.42-macos-arm64.tar.gz"
      sha256 "54f558c408f5c138deed454c1c322c95e59a44108a89cb2f78dcb20a5665d24f"
    end
    on_intel do
      url "https://github.com/Whq02/MercuryCLI/releases/download/v1.0.0-beta.42/mercury-v1.0.0-beta.42-macos-x64.tar.gz"
      sha256 "5a3eca96d555caf98a2ca4a25bc51d46abd68386a7c43ddbd28d33da9c2e42b7"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/Whq02/MercuryCLI/releases/download/v1.0.0-beta.42/mercury-v1.0.0-beta.42-linux-x64.tar.gz"
      sha256 "482f23bfeec77add9c9d6eb58152cc1a9ffd2e8340ee72954c4a911798324f7e"
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
