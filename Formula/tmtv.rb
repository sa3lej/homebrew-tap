class Tmtv < Formula
  desc "Terminal sharing built on tmux — share your terminal over SSH and the web"
  homepage "https://tmtv.se"
  version "1.8.0"
  license "ISC"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/sa3lej/tmtv/releases/download/v1.8.0/tmtv-macos-arm64"
      sha256 "52602898b139bc35394a33303674371123e9ede734079e64884815cc7cd94d72"
    elsif Hardware::CPU.intel?
      url "https://github.com/sa3lej/tmtv/releases/download/v1.8.0/tmtv-macos-amd64"
      sha256 "fd5df1de88c28e105aa90eb852ea87dda0b5e6b1c51e7cf6bfe7640c07973e2b"
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
