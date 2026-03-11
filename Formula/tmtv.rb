class Tmtv < Formula
  desc "Terminal sharing built on tmux — share your terminal over SSH and the web"
  homepage "https://tmtv.se"
  version "1.2.6"
  license "ISC"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/sa3lej/tmtv/releases/download/v1.2.6/tmtv-macos-arm64"
      sha256 "d52a783d46a4ee67ce4abfe4111180db4df15327d8bdb42ab396efa495fc9548"
    elsif Hardware::CPU.intel?
      url "https://github.com/sa3lej/tmtv/releases/download/v1.2.6/tmtv-macos-amd64"
      sha256 "b0a873d4011ebb827843d66fd2e7af42602fe95d6874b12ea3e3687a354e5f55"
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
