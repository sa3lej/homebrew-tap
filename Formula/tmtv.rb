class Tmtv < Formula
  desc "Terminal sharing built on tmux — share your terminal over SSH and the web"
  homepage "https://tmtv.se"
  version "1.3.6"
  license "ISC"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/sa3lej/tmtv/releases/download/v1.3.6/tmtv-macos-arm64"
      sha256 "99cb6235573863c4c12be108cdb631db7c2ed73913c912f875db3557f92a1303"
    elsif Hardware::CPU.intel?
      url "https://github.com/sa3lej/tmtv/releases/download/v1.3.6/tmtv-macos-amd64"
      sha256 "e9b83a0fa379e306851efe145c3944ecce5c27be1bc053dd4059c261eeee64e1"
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
