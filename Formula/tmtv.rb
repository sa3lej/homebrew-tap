class Tmtv < Formula
  desc "Terminal sharing built on tmux — share your terminal over SSH and the web"
  homepage "https://tmtv.se"
  version "1.4.3"
  license "ISC"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/sa3lej/tmtv/releases/download/v1.4.3/tmtv-macos-arm64"
      sha256 "061b112e4af9ac7613529e3de4122320f2b784f6097c7a68c815b977cbfc1457"
    elsif Hardware::CPU.intel?
      url "https://github.com/sa3lej/tmtv/releases/download/v1.4.3/tmtv-macos-amd64"
      sha256 "6f2f6a6f8299801aa96cae4690b0b7b614e12d02b4e22744bb7ee8e36ba392cc"
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
