class Tmtv < Formula
  desc "Terminal sharing built on tmux — share your terminal over SSH and the web"
  homepage "https://tmtv.se"
  version "1.5.9"
  license "ISC"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/sa3lej/tmtv/releases/download/v1.5.9/tmtv-macos-arm64"
      sha256 "dde89461bad853e26f469e0ce55ce443bd728b87a64e93e137dfd68d95888b69"
    elsif Hardware::CPU.intel?
      url "https://github.com/sa3lej/tmtv/releases/download/v1.5.9/tmtv-macos-amd64"
      sha256 "c212c4d64db427ef125af3756910df851cd987e474d2495fa41b246743dc3b46"
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
