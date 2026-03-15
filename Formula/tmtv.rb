class Tmtv < Formula
  desc "Terminal sharing built on tmux — share your terminal over SSH and the web"
  homepage "https://tmtv.se"
  version "1.7.2"
  license "ISC"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/sa3lej/tmtv/releases/download/v1.7.2/tmtv-macos-arm64"
      sha256 "5ea7c24a6553f49dc882cbbdd5e76200886e9788ceae017550556b17a2a2f790"
    elsif Hardware::CPU.intel?
      url "https://github.com/sa3lej/tmtv/releases/download/v1.7.2/tmtv-macos-amd64"
      sha256 "2b82a81a816229904e4047106510320682c9c8fd1d48ef1fb87db04cfe2777aa"
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
