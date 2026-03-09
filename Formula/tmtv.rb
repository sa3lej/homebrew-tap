class Tmtv < Formula
  desc "Terminal sharing built on tmux — share your terminal over SSH and the web"
  homepage "https://tmtv.se"
  version "1.2.1"
  license "ISC"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/sa3lej/tmtv/releases/download/v1.2.1/tmtv-macos-arm64"
      sha256 "4811a6e1079070d1cbe592abc28788ca0f8f5ede3c24d7d429741849591e4385"
    elsif Hardware::CPU.intel?
      url "https://github.com/sa3lej/tmtv/releases/download/v1.2.1/tmtv-macos-amd64"
      sha256 "574a53398b6a8614b7e17755bea078cd7062837697c72700e1209430a1f1f3b9"
    end
  end

  def install
    binary = Dir["tmtv-*"].first
    bin.install binary => "tmtv"
  end

  test do
    assert_match "tmtv", shell_output("#{bin}/tmtv -V")
  end
end
