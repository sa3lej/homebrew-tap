class Tmtv < Formula
  desc "Terminal sharing built on tmux — share your terminal over SSH and the web"
  homepage "https://tmtv.se"
  version "1.1.1"
  license "ISC"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/sa3lej/tmtv/releases/download/v1.1.1/tmtv-macos-arm64"
      sha256 "34b508f083f045778dbce7ae889f222cfb1eaf95a98bc275ac8b5711d04a82e3"
    elsif Hardware::CPU.intel?
      url "https://github.com/sa3lej/tmtv/releases/download/v1.1.1/tmtv-macos-amd64"
      sha256 "fb27730eb2eb613f4919345f9d58ea61ef1b129088b5abb3c9ba720a7eeb888a"
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
