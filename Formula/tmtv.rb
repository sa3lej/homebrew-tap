class Tmtv < Formula
  desc "Terminal sharing built on tmux — share your terminal over SSH and the web"
  homepage "https://tmtv.se"
  version "1.5.7"
  license "ISC"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/sa3lej/tmtv/releases/download/v1.5.7/tmtv-macos-arm64"
      sha256 "3059992c3ef2b154c65336b536eec0f02abc119585074890201317348e94f72a"
    elsif Hardware::CPU.intel?
      url "https://github.com/sa3lej/tmtv/releases/download/v1.5.7/tmtv-macos-amd64"
      sha256 "b3b98b6be49c839f09311204d272150beadd02711d54fc5b4e36344b2a417deb"
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
