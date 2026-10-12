# Homebrew formula for Mercury — the tap is github.com/Whq02/homebrew-mercury
#   brew install Whq02/mercury/mercury
# The sha256 values come from the release's SHA256SUMS.txt.
class Mercury < Formula
  desc "AI coding sessions in your terminal, on the providers you choose"
  homepage "https://mercury-cli.ai"
  version "1.0.0-beta.32"
  license "SEE LICENSE IN https://github.com/Whq02/MercuryCLI/blob/main/LICENSE.md"

  on_macos do
    on_arm do
      url "https://github.com/Whq02/MercuryCLI/releases/download/v1.0.0-beta.32/mercury-v1.0.0-beta.32-macos-arm64.tar.gz"
      sha256 "e12fef46caebb7982f3d21ee028867d0f3ac100065db581248fbf593d1956fa1"
    end
    on_intel do
      url "https://github.com/Whq02/MercuryCLI/releases/download/v1.0.0-beta.32/mercury-v1.0.0-beta.32-macos-x64.tar.gz"
      sha256 "2ee0652ea3493f756b9c4d445b8f236eb858e33df7dadf63c4259f4930599388"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/Whq02/MercuryCLI/releases/download/v1.0.0-beta.32/mercury-v1.0.0-beta.32-linux-x64.tar.gz"
      sha256 "b4c4867ff6ea7c321226c25eaa28f275854468df31ed93babfad2583858b704f"
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
