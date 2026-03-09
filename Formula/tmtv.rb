class Tmtv < Formula
  desc "Terminal sharing built on tmux — share your terminal over SSH and the web"
  homepage "https://tmtv.se"
  version "1.2.3"
  license "ISC"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/sa3lej/tmtv/releases/download/v1.2.3/tmtv-macos-arm64"
      sha256 "719245bde5d167cc30657f5d300cb83a34fc3d26a0e7479ef165c49ba21ceb76"
    elsif Hardware::CPU.intel?
      url "https://github.com/sa3lej/tmtv/releases/download/v1.2.3/tmtv-macos-amd64"
      sha256 "954937ad70538d4ccc7fb9202c9bb8f648e8774951ff78fd8645bf278dff9efb"
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
