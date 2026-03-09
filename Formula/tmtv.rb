class Tmtv < Formula
  desc "Terminal sharing built on tmux — share your terminal over SSH and the web"
  homepage "https://tmtv.se"
  version "1.1.0"
  license "ISC"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/sa3lej/tmtv/releases/download/v1.1.0/tmtv-macos-arm64"
      sha256 "b23ac2ffd3fa15b9e09da97f08ac2f2680c47c193194faa9d208cef3d88568ea"
    elsif Hardware::CPU.intel?
      url "https://github.com/sa3lej/tmtv/releases/download/v1.1.0/tmtv-macos-amd64"
      sha256 "ac81a1a75c8ba6acf050b927af145caf73470cf14d966927dab35d7a22d1b5c0"
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
