class Tmtv < Formula
  desc "Terminal sharing built on tmux — share your terminal over SSH and the web"
  homepage "https://tmtv.se"
  version "1.8.1"
  license "ISC"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/sa3lej/tmtv/releases/download/v1.8.1/tmtv-macos-arm64"
      sha256 "6119733769a9cfd5482d43856c02e1622f8fd2116bbcccda316a0a651ed11e8d"
    elsif Hardware::CPU.intel?
      url "https://github.com/sa3lej/tmtv/releases/download/v1.8.1/tmtv-macos-amd64"
      sha256 "601f200bc4d7a29b91eee5410006cced6735286111d274996e1a407d0844ac16"
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
