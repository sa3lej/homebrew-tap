class Tmtv < Formula
  desc "Terminal sharing built on tmux — share your terminal over SSH and the web"
  homepage "https://tmtv.se"
  version "1.6.2"
  license "ISC"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/sa3lej/tmtv/releases/download/v1.6.2/tmtv-macos-arm64"
      sha256 "c4274cca6714bbb4df6ec0470bbd47872be212660fb1f0c9bc0b68f1ed128427"
    elsif Hardware::CPU.intel?
      url "https://github.com/sa3lej/tmtv/releases/download/v1.6.2/tmtv-macos-amd64"
      sha256 "29ae0d8b4ba29fa94e0586591a5c2eff659d2e379f124a99c99a8b6f84d398a4"
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
