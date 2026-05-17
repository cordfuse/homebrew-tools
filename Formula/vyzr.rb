class Vyzr < Formula
  desc "Vyzr — manage AI agents and the Vyzr server from your terminal"
  homepage "https://github.com/cordfuse/vyzr"
  version "0.9.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/cordfuse/vyzr/releases/download/v0.9.1/vyzr-darwin-arm64"
      sha256 "3b3789aa30a88e8c81801426ce61cebd5c64efaafa32c8a481e529bb13a68a1b"
    end
    on_intel do
      url "https://github.com/cordfuse/vyzr/releases/download/v0.9.1/vyzr-darwin-x64"
      sha256 "0f4c1cfe70e963ecb357aaa52128e7ab20ace2b786b75b536abdac4dd9aa0ad2"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/cordfuse/vyzr/releases/download/v0.9.1/vyzr-linux-x64"
      sha256 "2afff8e3d29e9af29e594824af404fc5a27200a48e4608e87d1e0c6aed31345c"
    end
    on_arm do
      url "https://github.com/cordfuse/vyzr/releases/download/v0.9.1/vyzr-linux-arm64"
      sha256 "d94eea91cea1a51055146c7e61f2e1fc8a8535c90b1be0d84143affab4d51482"
    end
  end

  def install
    bin.install Dir["vyzr-*"].first => "vyzr"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/vyzr --version")
  end
end
