class Tmtv < Formula
  desc "Terminal sharing built on tmux — share your terminal over SSH and the web"
  homepage "https://tmtv.se"
  version "1.5.6"
  license "ISC"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/sa3lej/tmtv/releases/download/v1.5.6/tmtv-macos-arm64"
      sha256 "ed6dfbd2dd869a9280bee9c413ad3622bf0d9a84e99ebd91c159c042f4c3dd7b"
    elsif Hardware::CPU.intel?
      url "https://github.com/sa3lej/tmtv/releases/download/v1.5.6/tmtv-macos-amd64"
      sha256 "57fb0a1c8d3a0da7ac57ed76f9395d7f53f4c963a24494b398deb10b202c8373"
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
