class Tmtv < Formula
  desc "Terminal sharing built on tmux — share your terminal over SSH and the web"
  homepage "https://tmtv.se"
  version "1.5.1"
  license "ISC"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/sa3lej/tmtv/releases/download/v1.5.1/tmtv-macos-arm64"
      sha256 "187f8ce2d652dc96ced796b04cdd11a27f36511ca362791a2a1e58c9f1bb5008"
    elsif Hardware::CPU.intel?
      url "https://github.com/sa3lej/tmtv/releases/download/v1.5.1/tmtv-macos-amd64"
      sha256 "2d6eab90ff6c2521d09a17d6d18cfc0d9b8d0bce445649f4c47c6999527455d7"
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
