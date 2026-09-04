# Homebrew formula for Mercury — the tap is github.com/Whq02/homebrew-mercury
#   brew install Whq02/mercury/mercury
# The sha256 values come from the release's SHA256SUMS.txt (fill-sha.sh).
class Mercury < Formula
  desc "Terminal harness for software development"
  homepage "https://mercury-cli.ai"
  version "1.0.0-beta.2"
  license "SEE LICENSE IN https://github.com/Whq02/MercuryCLI/blob/main/LICENSE.md"

  on_macos do
    on_arm do
      url "https://github.com/Whq02/MercuryCLI/releases/download/v1.0.0-beta.2/mercury-v1.0.0-beta.2-macos-arm64.tar.gz"
      sha256 "6b663e1dd8af0ff544d75c5c5976aead9636d63f8e81718efcac836c01e589b9"
    end
    # No Intel Mac build in this release.
  end
  on_linux do
    on_intel do
      url "https://github.com/Whq02/MercuryCLI/releases/download/v1.0.0-beta.2/mercury-v1.0.0-beta.2-linux-x64.tar.gz"
      sha256 "ac5898eca057a344cc308f2a2f826853712f5d31aadab9d1d593b6c73eba2185"
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
