class Tmtv < Formula
  desc "Terminal sharing built on tmux — share your terminal over SSH and the web"
  homepage "https://tmtv.se"
  version "1.5.4"
  license "ISC"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/sa3lej/tmtv/releases/download/v1.5.4/tmtv-macos-arm64"
      sha256 "74ad3e8bb9666e93c3c405b35365fd268c951e43c5e0916ff44bc4f68c6b600c"
    elsif Hardware::CPU.intel?
      url "https://github.com/sa3lej/tmtv/releases/download/v1.5.4/tmtv-macos-amd64"
      sha256 "0f5d6b9097295d67e44efcd326a9cabcfd253a22b95d6ab869000e13cd2e72ac"
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
