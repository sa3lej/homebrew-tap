class Tmtv < Formula
  desc "Terminal sharing built on tmux — share your terminal over SSH and the web"
  homepage "https://tmtv.se"
  version "2.0.4"
  license "ISC"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/sa3lej/tmtv/releases/download/v2.0.4/tmtv-macos-arm64"
      sha256 "fd2ff6604fa0d559919f6a1431187b1037fad9966eed6c49ec251a2f7ecc2eaf"
    elsif Hardware::CPU.intel?
      url "https://github.com/sa3lej/tmtv/releases/download/v2.0.4/tmtv-macos-amd64"
      sha256 "24e9e6c245bc776e243919989d7ca81455dd324a6270911b4fab208ebd617a67"
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
