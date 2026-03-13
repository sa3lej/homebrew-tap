class Tmtv < Formula
  desc "Terminal sharing built on tmux — share your terminal over SSH and the web"
  homepage "https://tmtv.se"
  version "1.4.2"
  license "ISC"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/sa3lej/tmtv/releases/download/v1.4.2/tmtv-macos-arm64"
      sha256 "9672c1f0b04441c96c119e80e13489e743e4130e58ace470b86f28f7a2444748"
    elsif Hardware::CPU.intel?
      url "https://github.com/sa3lej/tmtv/releases/download/v1.4.2/tmtv-macos-amd64"
      sha256 "b7cfb7bd52d7d77876373bdc59381f05951f9b52a72f44c634a75fdd8ed19c38"
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
