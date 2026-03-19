class Tmtv < Formula
  desc "Terminal sharing built on tmux — share your terminal over SSH and the web"
  homepage "https://tmtv.se"
  version "1.9.3"
  license "ISC"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/sa3lej/tmtv/releases/download/v1.9.3/tmtv-macos-arm64"
      sha256 "5d8b637c6fc1e2d824cc733b221b55bc35ba7d7e329d1dcf7324de696e75716c"
    elsif Hardware::CPU.intel?
      url "https://github.com/sa3lej/tmtv/releases/download/v1.9.3/tmtv-macos-amd64"
      sha256 "1418415b536a100d841fe449c03017993cb77320c2e6863f24e127930d63baa4"
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
