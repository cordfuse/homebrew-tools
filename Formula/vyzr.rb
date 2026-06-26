class Vyzr < Formula
  desc "Vyzr — manage AI agents and the Vyzr server from your terminal"
  homepage "https://github.com/cordfuse/vyzr"
  version "0.10.4"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/cordfuse/vyzr/releases/download/v0.10.4/vyzr-darwin-arm64"
      sha256 "ab94778ce63ab819a73462e67b0d118ec51849133892eb46838d28c0fd070c97"
    end
    on_intel do
      url "https://github.com/cordfuse/vyzr/releases/download/v0.10.4/vyzr-darwin-x64"
      sha256 "67460cf06071ff3d9b766b63877c75f4d0fff43f7d397239dee1c57d14629f80"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/cordfuse/vyzr/releases/download/v0.10.4/vyzr-linux-x64"
      sha256 "c08bfd00ca27b7a0a66345140bb1ec9239a678cca50ea9a71f80adbc2ef3bb29"
    end
    on_arm do
      url "https://github.com/cordfuse/vyzr/releases/download/v0.10.4/vyzr-linux-arm64"
      sha256 "9e874b291ee74c7b42901833d9a755b029a5538162ae0a5c529144e5a63b63e5"
    end
  end

  def install
    bin.install Dir["vyzr-*"].first => "vyzr"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/vyzr --version")
  end
end
