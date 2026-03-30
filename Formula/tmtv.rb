class Tmtv < Formula
  desc "Terminal sharing built on tmux — share your terminal over SSH and the web"
  homepage "https://tmtv.se"
  version "2.0.1"
  license "ISC"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/sa3lej/tmtv/releases/download/v2.0.1/tmtv-macos-arm64"
      sha256 "c0ad4244c47d51071efdfe946d9e188f3035accd1253071627c96838d978676f"
    elsif Hardware::CPU.intel?
      url "https://github.com/sa3lej/tmtv/releases/download/v2.0.1/tmtv-macos-amd64"
      sha256 "27290c52365a11f45b86f2ea0ed10e57feb61efde878d2177c69451fbad8c8a7"
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
