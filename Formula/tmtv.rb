class Tmtv < Formula
  desc "Terminal sharing built on tmux — share your terminal over SSH and the web"
  homepage "https://tmtv.se"
  version "1.4.1"
  license "ISC"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/sa3lej/tmtv/releases/download/v1.4.1/tmtv-macos-arm64"
      sha256 "b44a622ba2b8150b7831516e824ba14767f0c8e3934cdb733e789b75cda2349d"
    elsif Hardware::CPU.intel?
      url "https://github.com/sa3lej/tmtv/releases/download/v1.4.1/tmtv-macos-amd64"
      sha256 "f48b6a64beae58174d8afe143dc03cae86ed61e71ce7413d69235a06750805df"
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
