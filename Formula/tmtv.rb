class Tmtv < Formula
  desc "Terminal sharing built on tmux — share your terminal over SSH and the web"
  homepage "https://tmtv.se"
  version "1.6.3"
  license "ISC"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/sa3lej/tmtv/releases/download/v1.6.3/tmtv-macos-arm64"
      sha256 "a9aaa2904f92eb6680729e66cae2e2d080000f954eeb9d0ffc871f586c4fbf03"
    elsif Hardware::CPU.intel?
      url "https://github.com/sa3lej/tmtv/releases/download/v1.6.3/tmtv-macos-amd64"
      sha256 "5a883676d19886424c83996b85a82aaad4286250518b43a5012a3eb371908500"
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
