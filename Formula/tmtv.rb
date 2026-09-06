class Tmtv < Formula
  desc "Terminal sharing built on tmux — share your terminal over SSH and the web"
  homepage "https://tmtv.se"
  version "2.0.3"
  license "ISC"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/sa3lej/tmtv/releases/download/v2.0.3/tmtv-macos-arm64"
      sha256 "f33f5a7833b231488fbb854555be7dd41bd8c4c62aedb1dd668044da1202c1f7"
    elsif Hardware::CPU.intel?
      url "https://github.com/sa3lej/tmtv/releases/download/v2.0.3/tmtv-macos-amd64"
      sha256 "42982457c7ac3d3be3e59a8eb70eb6cfa93db179b17c45a1a10211dbe94635ef"
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
