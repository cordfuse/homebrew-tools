class Vyzr < Formula
  desc "Vyzr — manage AI agents and the Vyzr server from your terminal"
  homepage "https://github.com/cordfuse/vyzr"
  version "0.9.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/cordfuse/vyzr/releases/download/v0.9.2/vyzr-darwin-arm64"
      sha256 "497d3308282473e34cb31b96b89fdfafaf216cabe9f6af3cc673b20d296e1849"
    end
    on_intel do
      url "https://github.com/cordfuse/vyzr/releases/download/v0.9.2/vyzr-darwin-x64"
      sha256 "ff55c062336f9de0819ea37153300e963bb8fcda920c8100cab9858ee54ad1fd"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/cordfuse/vyzr/releases/download/v0.9.2/vyzr-linux-x64"
      sha256 "db297b82cc12cf9243f16054a81beaa7fd499e16b272a9f47a1d023fdf54cf6c"
    end
    on_arm do
      url "https://github.com/cordfuse/vyzr/releases/download/v0.9.2/vyzr-linux-arm64"
      sha256 "ce7b10d5ae324732c0a9ac568ceb4c2825d082bae4246515a3b5af3d8cd56560"
    end
  end

  def install
    bin.install Dir["vyzr-*"].first => "vyzr"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/vyzr --version")
  end
end
