class Tmtv < Formula
  desc "Terminal sharing built on tmux — share your terminal over SSH and the web"
  homepage "https://tmtv.se"
  version "1.5.0"
  license "ISC"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/sa3lej/tmtv/releases/download/v1.5.0/tmtv-macos-arm64"
      sha256 "5eb00376f9d841f9a37fcb5c7f92eaa73e12b28f32b0570623d85a9eea6f19d9"
    elsif Hardware::CPU.intel?
      url "https://github.com/sa3lej/tmtv/releases/download/v1.5.0/tmtv-macos-amd64"
      sha256 "f79e0ebcd9de990cbaf75d908de2209502cf6b0542cf1493f1704d2b73f016fb"
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
