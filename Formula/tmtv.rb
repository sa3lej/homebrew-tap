class Tmtv < Formula
  desc "Terminal sharing built on tmux — share your terminal over SSH and the web"
  homepage "https://tmtv.se"
  version "1.7.1"
  license "ISC"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/sa3lej/tmtv/releases/download/v1.7.1/tmtv-macos-arm64"
      sha256 "ab45e54022da9bf810932efb56237c6c1b9ab74b53f443dd06236532189871b6"
    elsif Hardware::CPU.intel?
      url "https://github.com/sa3lej/tmtv/releases/download/v1.7.1/tmtv-macos-amd64"
      sha256 "ea6e36e38f7152b74dce5118e81a58a7138b406d113242196210978c86d7d322"
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
