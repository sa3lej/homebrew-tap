class Tmtv < Formula
  desc "Terminal sharing built on tmux — share your terminal over SSH and the web"
  homepage "https://tmtv.se"
  version "1.6.0"
  license "ISC"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/sa3lej/tmtv/releases/download/v1.6.0/tmtv-macos-arm64"
      sha256 "39885f53f6d3295ce21c436084826f4d7e8801531a41d8cc91a098dc99fedbee"
    elsif Hardware::CPU.intel?
      url "https://github.com/sa3lej/tmtv/releases/download/v1.6.0/tmtv-macos-amd64"
      sha256 "1b97ae09b5cfb01a3b3558ce229f086147b798dec9a3d9f186864bc31c549c28"
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
