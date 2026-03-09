class Tmtv < Formula
  desc "Terminal sharing built on tmux — share your terminal over SSH and the web"
  homepage "https://tmtv.se"
  version "1.2.4"
  license "ISC"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/sa3lej/tmtv/releases/download/v1.2.4/tmtv-macos-arm64"
      sha256 "b44a4abcd02b89e8256708724d1ebe1dc84e73c18d8447cff271a237d2b6445e"
    elsif Hardware::CPU.intel?
      url "https://github.com/sa3lej/tmtv/releases/download/v1.2.4/tmtv-macos-amd64"
      sha256 "46306a33c2ff81cf4aa3ba20b8a67b83cd9953b91082925ec8d511f657a35764"
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
