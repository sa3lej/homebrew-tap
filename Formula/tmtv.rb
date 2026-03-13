class Tmtv < Formula
  desc "Terminal sharing built on tmux — share your terminal over SSH and the web"
  homepage "https://tmtv.se"
  version "1.4.5"
  license "ISC"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/sa3lej/tmtv/releases/download/v1.4.5/tmtv-macos-arm64"
      sha256 "e1a7ef448e69ce0a1942ecfae9cc944f20430306eb1ba5c442254fcd60c86d04"
    elsif Hardware::CPU.intel?
      url "https://github.com/sa3lej/tmtv/releases/download/v1.4.5/tmtv-macos-amd64"
      sha256 "ddfd09f5dba26b0f307ac8d5c57b3c0cf5d62ca4903d68a7c3f4785e6a8f8fe3"
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
