# Homebrew formula for Mercury — the tap is github.com/Whq02/homebrew-mercury
#   brew install Whq02/mercury/mercury
# The sha256 values come from the release's SHA256SUMS.txt.
class Mercury < Formula
  desc "Terminal harness for software development"
  homepage "https://mercury-cli.ai"
  version "1.0.0-beta.15"
  license "SEE LICENSE IN https://github.com/Whq02/MercuryCLI/blob/main/LICENSE.md"

  on_macos do
    on_arm do
      url "https://github.com/Whq02/MercuryCLI/releases/download/v1.0.0-beta.15/mercury-v1.0.0-beta.15-macos-arm64.tar.gz"
      sha256 "d777980e71d09c923d1d491bda5a07066c49229cd8cfd369f9d624c20d563bf1"
    end
    on_intel do
      url "https://github.com/Whq02/MercuryCLI/releases/download/v1.0.0-beta.15/mercury-v1.0.0-beta.15-macos-x64.tar.gz"
      sha256 "4bfb200b361363e7acbae65f47706acd7050864290ef5ef9f224718b6ccdfc14"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/Whq02/MercuryCLI/releases/download/v1.0.0-beta.15/mercury-v1.0.0-beta.15-linux-x64.tar.gz"
      sha256 "fba59477d61675633fc06ee1f381a38daf033483bced5d8ac1e17793b8a211f3"
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
