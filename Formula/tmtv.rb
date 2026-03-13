class Tmtv < Formula
  desc "Terminal sharing built on tmux — share your terminal over SSH and the web"
  homepage "https://tmtv.se"
  version "1.4.4"
  license "ISC"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/sa3lej/tmtv/releases/download/v1.4.4/tmtv-macos-arm64"
      sha256 "d2c719966717f44a63f1d4a867db17caec5318020d6360d427982fe48c76fb11"
    elsif Hardware::CPU.intel?
      url "https://github.com/sa3lej/tmtv/releases/download/v1.4.4/tmtv-macos-amd64"
      sha256 "8bcf567c9b58d01dca5ce1f2758c92043a633afe01fff8deff5700f7e876ffc4"
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
