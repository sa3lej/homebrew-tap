class Tmtv < Formula
  desc "Terminal sharing built on tmux — share your terminal over SSH and the web"
  homepage "https://tmtv.se"
  version "1.0.0"
  license "ISC"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/sa3lej/tmtv/releases/download/v1.0.0/tmtv-macos-arm64"
      sha256 "ea6039e6be3e0de8a3a06d544d2a1c9203f1ed4e25fd87e802f33a51525f23f0"
    elsif Hardware::CPU.intel?
      url "https://github.com/sa3lej/tmtv/releases/download/v1.0.0/tmtv-macos-amd64"
      sha256 "defb9ba3bc792e24f825d6f8480661379448636b4cb04ab8f3c702184f0e1e3c"
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
