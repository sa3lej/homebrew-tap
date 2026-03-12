class Tmtv < Formula
  desc "Terminal sharing built on tmux — share your terminal over SSH and the web"
  homepage "https://tmtv.se"
  version "1.3.5"
  license "ISC"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/sa3lej/tmtv/releases/download/v1.3.5/tmtv-macos-arm64"
      sha256 "91e241a5c1cfb738bf6672c5eda66e95c1757d61e5d6e384b163a5e7613f9852"
    elsif Hardware::CPU.intel?
      url "https://github.com/sa3lej/tmtv/releases/download/v1.3.5/tmtv-macos-amd64"
      sha256 "de890a69f2c10da0561360b1ef151becba40cb23bbb244f1f7d4e0edcf182c63"
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
