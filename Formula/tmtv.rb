class Tmtv < Formula
  desc "Terminal sharing built on tmux — share your terminal over SSH and the web"
  homepage "https://tmtv.se"
  version "1.5.10"
  license "ISC"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/sa3lej/tmtv/releases/download/v1.5.10/tmtv-macos-arm64"
      sha256 "89858d64188d047c8fe7f1ae0132a9bcf38d9209be45ec5b915b5172b4003b6c"
    elsif Hardware::CPU.intel?
      url "https://github.com/sa3lej/tmtv/releases/download/v1.5.10/tmtv-macos-amd64"
      sha256 "2d2e66c5c8825bc587c50197089e8abcb5ae5f04be5716a065ec504006a25aff"
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
