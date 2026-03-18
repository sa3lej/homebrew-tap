class Tmtv < Formula
  desc "Terminal sharing built on tmux — share your terminal over SSH and the web"
  homepage "https://tmtv.se"
  version "1.9.0"
  license "ISC"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/sa3lej/tmtv/releases/download/v1.9.0/tmtv-macos-arm64"
      sha256 "caac2dafe8717aa52accd6bcfae472533865066e9dc6a5ec40c735557d020497"
    elsif Hardware::CPU.intel?
      url "https://github.com/sa3lej/tmtv/releases/download/v1.9.0/tmtv-macos-amd64"
      sha256 "bf79ed3fc3d00eac220edab0c0aef2c0b9e9878938b63baafcc6d02b966b64e1"
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
