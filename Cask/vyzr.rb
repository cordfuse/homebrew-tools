cask "vyzr" do
  version "0.10.3"

  on_arm do
    url "https://github.com/cordfuse/vyzr/releases/download/v0.10.3/Vyzr-#{version}-arm64.dmg"
    sha256 ""
  end
  on_intel do
    url "https://github.com/cordfuse/vyzr/releases/download/v0.10.3/Vyzr-#{version}.dmg"
    sha256 ""
  end

  name "Vyzr"
  desc "Your agent. Any device. No terminal."
  homepage "https://github.com/cordfuse/vyzr"

  app "Vyzr.app"

  zap trash: [
    "~/.vyzr",
    "~/Library/Application Support/Vyzr",
    "~/Library/Preferences/com.cordfuse.vyzr.plist",
    "~/Library/Saved Application State/com.cordfuse.vyzr.savedState",
  ]
end
