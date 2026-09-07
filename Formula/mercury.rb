# Homebrew formula for Mercury — the tap is github.com/Whq02/homebrew-mercury
#   brew install Whq02/mercury/mercury
# The sha256 values come from the release's SHA256SUMS.txt.
class Mercury < Formula
  desc "Terminal harness for software development"
  homepage "https://mercury-cli.ai"
  version "1.0.0-beta.4"
  license "SEE LICENSE IN https://github.com/Whq02/MercuryCLI/blob/main/LICENSE.md"

  on_macos do
    on_arm do
      url "https://github.com/Whq02/MercuryCLI/releases/download/v1.0.0-beta.4/mercury-v1.0.0-beta.4-macos-arm64.tar.gz"
      sha256 "4f3a6c8e72adffc03b934cf14325298ae55c6853594da77e38cd1d09076b06d9"
    end
    on_intel do
      url "https://github.com/Whq02/MercuryCLI/releases/download/v1.0.0-beta.4/mercury-v1.0.0-beta.4-macos-x64.tar.gz"
      sha256 "98c753ffd8aace6b28f0250fdc40e1211b408c33d98281a186782865241a86ac"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/Whq02/MercuryCLI/releases/download/v1.0.0-beta.4/mercury-v1.0.0-beta.4-linux-x64.tar.gz"
      sha256 "807de7e21996ca6493ac6faadc766efbd65f4ae2510a6e815100e10193903429"
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
