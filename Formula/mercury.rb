# Homebrew formula for Mercury — the tap is github.com/Whq02/homebrew-mercury
#   brew install Whq02/mercury/mercury
# The sha256 values come from the release's SHA256SUMS.txt.
class Mercury < Formula
  desc "AI coding sessions in your terminal, on the providers you choose"
  homepage "https://mercury-cli.ai"
  version "1.0.0-beta.23"
  license "SEE LICENSE IN https://github.com/Whq02/MercuryCLI/blob/main/LICENSE.md"

  on_macos do
    on_arm do
      url "https://github.com/Whq02/MercuryCLI/releases/download/v1.0.0-beta.23/mercury-v1.0.0-beta.23-macos-arm64.tar.gz"
      sha256 "f7a51de499a151c25ce7218b3df2d3fc7b460b3fdb68702fd75fb618ae3f7b4c"
    end
    on_intel do
      url "https://github.com/Whq02/MercuryCLI/releases/download/v1.0.0-beta.23/mercury-v1.0.0-beta.23-macos-x64.tar.gz"
      sha256 "3ce6c914d6176671779429f9cd2bf6cf20166d4195a87ce132f0b26244bd6dcb"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/Whq02/MercuryCLI/releases/download/v1.0.0-beta.23/mercury-v1.0.0-beta.23-linux-x64.tar.gz"
      sha256 "b9a771f3639b57666dad509c474e46dd103e73940a1bc7d09970b235c1af92ca"
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
