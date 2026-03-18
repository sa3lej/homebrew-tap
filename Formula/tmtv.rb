class Tmtv < Formula
  desc "Terminal sharing built on tmux — share your terminal over SSH and the web"
  homepage "https://tmtv.se"
  version "1.9.2"
  license "ISC"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/sa3lej/tmtv/releases/download/v1.9.2/tmtv-macos-arm64"
      sha256 "99f2aa6319cdc5278e07fe332cece35450c200d6403a44a414ddf59e612c9a40"
    elsif Hardware::CPU.intel?
      url "https://github.com/sa3lej/tmtv/releases/download/v1.9.2/tmtv-macos-amd64"
      sha256 "b054359f57b6d8113f0131f63f215fc6736dee2263df35ceec0e7986e5ef9d07"
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
