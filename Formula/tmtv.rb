class Tmtv < Formula
  desc "Terminal sharing built on tmux — share your terminal over SSH and the web"
  homepage "https://tmtv.se"
  version "1.3.0"
  license "ISC"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/sa3lej/tmtv/releases/download/v1.3.0/tmtv-macos-arm64"
      sha256 "56ea7f8cbb827d36ab88b2df7731054426cb2e7547ddbb1eb35039288513e0d9"
    elsif Hardware::CPU.intel?
      url "https://github.com/sa3lej/tmtv/releases/download/v1.3.0/tmtv-macos-amd64"
      sha256 "9aeb5a6dd4540fe7b91f068b4a83de449221ed79737c9e5dc2575925be15b7f0"
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
