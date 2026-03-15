class Tmtv < Formula
  desc "Terminal sharing built on tmux — share your terminal over SSH and the web"
  homepage "https://tmtv.se"
  version "1.6.1"
  license "ISC"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/sa3lej/tmtv/releases/download/v1.6.1/tmtv-macos-arm64"
      sha256 "4e09fd20ae17671746023c4d6fc438131ed736ce10949b6174fc5fa8e3eaa93f"
    elsif Hardware::CPU.intel?
      url "https://github.com/sa3lej/tmtv/releases/download/v1.6.1/tmtv-macos-amd64"
      sha256 "e44c46f8a1a86ede8256e41cb8dc26182d5ab45e0447d567f15de719144ef010"
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
