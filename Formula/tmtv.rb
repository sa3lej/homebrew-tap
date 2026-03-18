class Tmtv < Formula
  desc "Terminal sharing built on tmux — share your terminal over SSH and the web"
  homepage "https://tmtv.se"
  version "1.9.1"
  license "ISC"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/sa3lej/tmtv/releases/download/v1.9.1/tmtv-macos-arm64"
      sha256 "c30bf1ea2de43f34a4999228130ea6bf307a4f2ee894ff480d05399fab5a358a"
    elsif Hardware::CPU.intel?
      url "https://github.com/sa3lej/tmtv/releases/download/v1.9.1/tmtv-macos-amd64"
      sha256 "c1612e942585a3570355a675aa52bf801860e0a39d2efa6a0b7b975d7d46630a"
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
