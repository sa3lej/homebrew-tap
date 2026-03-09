class Tmtv < Formula
  desc "Terminal sharing built on tmux — share your terminal over SSH and the web"
  homepage "https://tmtv.se"
  version "1.2.5"
  license "ISC"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/sa3lej/tmtv/releases/download/v1.2.5/tmtv-macos-arm64"
      sha256 "171e353caf9724a866c7a63add0bcf4f216846cd4d2d5e35c898419e7a722fec"
    elsif Hardware::CPU.intel?
      url "https://github.com/sa3lej/tmtv/releases/download/v1.2.5/tmtv-macos-amd64"
      sha256 "4d44ced8ae5fb629b55a81cbf5b8676ffd1506925eaff22496a20f511f8697e0"
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
