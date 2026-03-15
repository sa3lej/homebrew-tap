class Tmtv < Formula
  desc "Terminal sharing built on tmux — share your terminal over SSH and the web"
  homepage "https://tmtv.se"
  version "1.7.0"
  license "ISC"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/sa3lej/tmtv/releases/download/v1.7.0/tmtv-macos-arm64"
      sha256 "3fb1dfb2bf744ce4970ad679168781b273b51ee6a9b59584b4e978121e0259a0"
    elsif Hardware::CPU.intel?
      url "https://github.com/sa3lej/tmtv/releases/download/v1.7.0/tmtv-macos-amd64"
      sha256 "612b0db20dbbaaf62987e6787daea25c54d95bde2fbc0c7438095e7c5efd93c2"
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
