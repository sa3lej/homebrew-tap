class Tmtv < Formula
  desc "Terminal sharing built on tmux — share your terminal over SSH and the web"
  homepage "https://tmtv.se"
  version "1.3.1"
  license "ISC"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/sa3lej/tmtv/releases/download/v1.3.1/tmtv-macos-arm64"
      sha256 "b48a636f517aa9704903236d3a92dcc5dd1bd1f7fcf775619f736dcb85085b02"
    elsif Hardware::CPU.intel?
      url "https://github.com/sa3lej/tmtv/releases/download/v1.3.1/tmtv-macos-amd64"
      sha256 "ef24faa0489e39d809436b5a11bd8dd3ac93610d64a8a3bf7e5ba81f79351f0b"
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
