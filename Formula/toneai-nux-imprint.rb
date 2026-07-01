# Formula for homebrew-tools tap: cordfuse/homebrew-tools
# To install:
#   brew tap cordfuse/tools
#   brew install toneai-nux-imprint

class ToneaiNuxImprint < Formula
  desc "Setup wizard for ToneAI — AI-powered NUX MightyAmp tone assistant"
  homepage "https://github.com/cordfuse/toneai-nux-imprint"
  version "1.5.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/cordfuse/toneai-nux-imprint/releases/download/v1.5.2/toneai-nux-imprint-mac-arm64"
      sha256 "13e7439ebc2632715b30e45b60552c8070ceabd6feb666382072a70a69605ac9"
    end
    on_intel do
      url "https://github.com/cordfuse/toneai-nux-imprint/releases/download/v1.5.2/toneai-nux-imprint-mac-x64"
      sha256 "a19dbf16a2345c96d6c574a5bac323c096674b79141d1fb5e4ff4b09ca99f18f"
    end
  end

  def install
    bin.install Dir["toneai-nux-imprint-mac-*"].first => "toneai-nux-imprint"
  end

  test do
    assert_match "ToneAI", shell_output("#{bin}/toneai-nux-imprint --help 2>&1 || true")
  end
end
