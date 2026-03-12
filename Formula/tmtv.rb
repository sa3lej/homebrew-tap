class Tmtv < Formula
  desc "Terminal sharing built on tmux — share your terminal over SSH and the web"
  homepage "https://tmtv.se"
  version "1.3.7"
  license "ISC"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/sa3lej/tmtv/releases/download/v1.3.7/tmtv-macos-arm64"
      sha256 "027ae19b14859e8155209a84f7766593fa2119be074ac25539c381b2eb11769a"
    elsif Hardware::CPU.intel?
      url "https://github.com/sa3lej/tmtv/releases/download/v1.3.7/tmtv-macos-amd64"
      sha256 "395fc5b23b3edb1453f8b3f3058cc459284e100bfff9c52515c05891617915f2"
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
