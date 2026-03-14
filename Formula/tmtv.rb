class Tmtv < Formula
  desc "Terminal sharing built on tmux — share your terminal over SSH and the web"
  homepage "https://tmtv.se"
  version "1.5.8"
  license "ISC"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/sa3lej/tmtv/releases/download/v1.5.8/tmtv-macos-arm64"
      sha256 "d5a1d36ba29c0f8792d943c10365fb3e15de81863f4e34157111afbaf4675409"
    elsif Hardware::CPU.intel?
      url "https://github.com/sa3lej/tmtv/releases/download/v1.5.8/tmtv-macos-amd64"
      sha256 "c6f2edd2586d5adc39ffaca48863e2b943968a61d1aff2ce84fefef205ecdca5"
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
