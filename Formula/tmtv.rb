class Tmtv < Formula
  desc "Terminal sharing built on tmux — share your terminal over SSH and the web"
  homepage "https://tmtv.se"
  version "2.0.0"
  license "ISC"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/sa3lej/tmtv/releases/download/v2.0.0/tmtv-macos-arm64"
      sha256 "bc06225bd8d4e9e4dc20294941c35ccd42a20d784db86ad5bec1f9615e469c89"
    elsif Hardware::CPU.intel?
      url "https://github.com/sa3lej/tmtv/releases/download/v2.0.0/tmtv-macos-amd64"
      sha256 "bcb63ddd8a7f26c796e51bf98d2b282af71890168ec5b378bfeeabf0d037e264"
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
