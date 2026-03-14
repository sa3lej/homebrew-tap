class Tmtv < Formula
  desc "Terminal sharing built on tmux — share your terminal over SSH and the web"
  homepage "https://tmtv.se"
  version "1.5.3"
  license "ISC"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/sa3lej/tmtv/releases/download/v1.5.3/tmtv-macos-arm64"
      sha256 "43dd9b5d81ef9cdf7a29aef5dff306827a9723f3e617e07cee0f9abf2aeebbf3"
    elsif Hardware::CPU.intel?
      url "https://github.com/sa3lej/tmtv/releases/download/v1.5.3/tmtv-macos-amd64"
      sha256 "eebe99232f9e7a052ab5d2c0a1aff8f42674f2eefde388a2101d22aafe89d502"
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
