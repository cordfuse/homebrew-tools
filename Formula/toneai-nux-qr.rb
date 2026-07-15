# Formula for homebrew-tools repo: cordfuse/homebrew-tools
# To install:
#   brew tap cordfuse/tools
#   brew install toneai-nux-qr

class ToneaiNuxQr < Formula
  desc "AI-generated NUX MightyAmp QR tone presets for any song or album"
  homepage "https://github.com/cordfuse/toneai-nux-cli"
  version "1.5.4"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/cordfuse/toneai-nux-cli/releases/download/v#{version}/tnqr-mac-arm64"
      sha256 "1132f6095adcf4dd2a9ed118b2b50899d87ead12c5ae860b81ca355dda3d874c"
    end
    on_intel do
      url "https://github.com/cordfuse/toneai-nux-cli/releases/download/v#{version}/tnqr-mac-x64"
      sha256 "3e0bf5e32d0d6a319a3da85c509b8cd79b7b93a0117f22cf749cc10da714200c"
    end
  end

  def install
    bin.install Dir["tnqr-mac-*"].first => "tnqr"
  end

  test do
    assert_match "tnqr", shell_output("#{bin}/tnqr --help")
  end
end
