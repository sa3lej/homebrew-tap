class Tmtv < Formula
  desc "Terminal sharing built on tmux — share your terminal over SSH and the web"
  homepage "https://tmtv.se"
  version "1.5.1"
  license "ISC"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/sa3lej/tmtv/releases/download/v1.5.1/tmtv-macos-arm64"
      sha256 "cba7700cef11c4e53ec906318b87b43e491e7e0092756f201ba4e0fed99c65f8"
    elsif Hardware::CPU.intel?
      url "https://github.com/sa3lej/tmtv/releases/download/v1.5.1/tmtv-macos-amd64"
      sha256 "db911d030b274e8f3d21223b21f5b573d323fd5aa9324698c9ca45800aa5ae23"
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
