class Tmtv < Formula
  desc "Terminal sharing built on tmux — share your terminal over SSH and the web"
  homepage "https://tmtv.se"
  version "1.2.7"
  license "ISC"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/sa3lej/tmtv/releases/download/v1.2.7/tmtv-macos-arm64"
      sha256 "21bb6a180062d0019d097e655fc81798b2c62e73b721b04849d6f1065f9f0006"
    elsif Hardware::CPU.intel?
      url "https://github.com/sa3lej/tmtv/releases/download/v1.2.7/tmtv-macos-amd64"
      sha256 "6cdf357d4ca54577d06bb1606238d2cd8fcdff9a57c9bf769d2f5cdc1b504c2f"
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
