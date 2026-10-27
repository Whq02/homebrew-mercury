# Homebrew formula for Mercury — the tap is github.com/Whq02/homebrew-mercury
#   brew install Whq02/mercury/mercury
# The sha256 values come from the release's SHA256SUMS.txt.
class Mercury < Formula
  desc "AI coding sessions in your terminal, on the providers you choose"
  homepage "https://mercury-cli.ai"
  version "1.0.0-rc.1"
  license "SEE LICENSE IN https://github.com/Whq02/MercuryCLI/blob/main/LICENSE.md"

  on_macos do
    on_arm do
      url "https://github.com/Whq02/MercuryCLI/releases/download/v1.0.0-rc.1/mercury-v1.0.0-rc.1-macos-arm64.tar.gz"
      sha256 "616afe278d05558346292491f1a6572a05812f8fcfba4524447759c02cd40123"
    end
    on_intel do
      url "https://github.com/Whq02/MercuryCLI/releases/download/v1.0.0-rc.1/mercury-v1.0.0-rc.1-macos-x64.tar.gz"
      sha256 "c64e615da90c8fe3944bbd0d4061f63f576c91be47b3c06b19aed261d411b319"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/Whq02/MercuryCLI/releases/download/v1.0.0-rc.1/mercury-v1.0.0-rc.1-linux-x64.tar.gz"
      sha256 "02ea020193b239137edd125d619b1e2b7fb9a55748f0a6ef3352cda544a503eb"
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
