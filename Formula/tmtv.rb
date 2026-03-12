class Tmtv < Formula
  desc "Terminal sharing built on tmux — share your terminal over SSH and the web"
  homepage "https://tmtv.se"
  version "1.3.2"
  license "ISC"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/sa3lej/tmtv/releases/download/v1.3.2/tmtv-macos-arm64"
      sha256 "eab94f9cfc7225c0618bfe508b17ee680b206037e5a99a97a1b4b8a3e7a0cd7b"
    elsif Hardware::CPU.intel?
      url "https://github.com/sa3lej/tmtv/releases/download/v1.3.2/tmtv-macos-amd64"
      sha256 "5e8019d0043ac53cf869b59bcb7102006217f8d96dc2d2a5916e8f019cf1f9dd"
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
