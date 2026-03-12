class Tmtv < Formula
  desc "Terminal sharing built on tmux — share your terminal over SSH and the web"
  homepage "https://tmtv.se"
  version "1.3.3"
  license "ISC"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/sa3lej/tmtv/releases/download/v1.3.3/tmtv-macos-arm64"
      sha256 "484fb084b7e175ab514c179d094e6c8160d0cfad2fa0b7a681c19e96c6f1efe4"
    elsif Hardware::CPU.intel?
      url "https://github.com/sa3lej/tmtv/releases/download/v1.3.3/tmtv-macos-amd64"
      sha256 "1ce10a063a2167cf579632cf46439cf76c558358851c59132c9d1e10b116d2ec"
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
