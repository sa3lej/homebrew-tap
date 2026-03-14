class Tmtv < Formula
  desc "Terminal sharing built on tmux — share your terminal over SSH and the web"
  homepage "https://tmtv.se"
  version "1.5.2"
  license "ISC"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/sa3lej/tmtv/releases/download/v1.5.2/tmtv-macos-arm64"
      sha256 "e8af988409941e2de30cc1ab4326cf3a4fd24b419a488f3a1f9b0291840efbe8"
    elsif Hardware::CPU.intel?
      url "https://github.com/sa3lej/tmtv/releases/download/v1.5.2/tmtv-macos-amd64"
      sha256 "a65d2b6b995564759d270dfb0917ca23e41f11d60c236b889e83ccfaa0d756dd"
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
