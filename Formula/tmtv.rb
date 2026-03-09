class Tmtv < Formula
  desc "Terminal sharing built on tmux — share your terminal over SSH and the web"
  homepage "https://tmtv.se"
  version "1.2.2"
  license "ISC"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/sa3lej/tmtv/releases/download/v1.2.2/tmtv-macos-arm64"
      sha256 "510a8a2967094fa1ce29b8780b81a6c6ad9c4320f25b1ed5b151cd6fdd487ee2"
    elsif Hardware::CPU.intel?
      url "https://github.com/sa3lej/tmtv/releases/download/v1.2.2/tmtv-macos-amd64"
      sha256 "302636e9de98f77c7bcd307e0b2c0f235c4b00cdae4a4fac6c9b5bb9f15f99ef"
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
