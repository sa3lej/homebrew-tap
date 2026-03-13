class Tmtv < Formula
  desc "Terminal sharing built on tmux — share your terminal over SSH and the web"
  homepage "https://tmtv.se"
  version "1.4.0"
  license "ISC"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/sa3lej/tmtv/releases/download/v1.4.0/tmtv-macos-arm64"
      sha256 "8aba0b574e62de97a5433dfc8c6629898d83bc50a1161ee6a3de70c9dc943456"
    elsif Hardware::CPU.intel?
      url "https://github.com/sa3lej/tmtv/releases/download/v1.4.0/tmtv-macos-amd64"
      sha256 "d05406fa3076be7bf8990f12e0d513c1cd9b23207012301001fb833a5d8b2b72"
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
