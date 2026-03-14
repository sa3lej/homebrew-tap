class Tmtv < Formula
  desc "Terminal sharing built on tmux — share your terminal over SSH and the web"
  homepage "https://tmtv.se"
  version "1.5.5"
  license "ISC"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/sa3lej/tmtv/releases/download/v1.5.5/tmtv-macos-arm64"
      sha256 "25e4257a553418a8da4eecd8c6df51da32c3c8192b34b7caa63f7f631c8d80a3"
    elsif Hardware::CPU.intel?
      url "https://github.com/sa3lej/tmtv/releases/download/v1.5.5/tmtv-macos-amd64"
      sha256 "1d09cb6df27753a71ef4f7bd0cc1c5f2cc68153d021079d5588587331de94cdf"
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
