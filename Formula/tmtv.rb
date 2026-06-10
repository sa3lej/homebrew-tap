class Tmtv < Formula
  desc "Terminal sharing built on tmux — share your terminal over SSH and the web"
  homepage "https://tmtv.se"
  version "2.0.2"
  license "ISC"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/sa3lej/tmtv/releases/download/v2.0.2/tmtv-macos-arm64"
      sha256 "516faa0248d0c8d12fc68874f8b2c815cc467f57a4f81d5e3d3709078d6e3204"
    elsif Hardware::CPU.intel?
      url "https://github.com/sa3lej/tmtv/releases/download/v2.0.2/tmtv-macos-amd64"
      sha256 "f4a78cfb6a9b301cd1a3b7adeb7ef5082051adf40df107842bedabc98d2e98c7"
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
