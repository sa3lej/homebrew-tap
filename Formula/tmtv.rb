class Tmtv < Formula
  desc "Terminal sharing built on tmux — share your terminal over SSH and the web"
  homepage "https://tmtv.se"
  version "1.8.2"
  license "ISC"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/sa3lej/tmtv/releases/download/v1.8.2/tmtv-macos-arm64"
      sha256 "a03181e2625cbfcdc6b0dc15c0897e7a483cb52ef50aa09df4ba481dfbc9a97c"
    elsif Hardware::CPU.intel?
      url "https://github.com/sa3lej/tmtv/releases/download/v1.8.2/tmtv-macos-amd64"
      sha256 "d012c2c31ae6753e81d602d17631cdaea824858b787515cf9bd3ffe373b5249d"
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
