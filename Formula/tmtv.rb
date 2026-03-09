class Tmtv < Formula
  desc "Terminal sharing built on tmux — share your terminal over SSH and the web"
  homepage "https://tmtv.se"
  version "1.2.0"
  license "ISC"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/sa3lej/tmtv/releases/download/v1.2.0/tmtv-macos-arm64"
      sha256 "559437fe279f63ac6bc95aea7d2b5b759bbf7b85c7b510870ddd89afcf989442"
    elsif Hardware::CPU.intel?
      url "https://github.com/sa3lej/tmtv/releases/download/v1.2.0/tmtv-macos-amd64"
      sha256 "005cd7a7190962e965d13c85332a408206b23e14993173ea3ea7b2bdf3382fc2"
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
