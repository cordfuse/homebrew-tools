cask "vyzr" do
  version "0.9.1"

  on_arm do
    url "https://github.com/cordfuse/vyzr/releases/download/v0.9.1/Vyzr-#{version}-arm64.dmg"
    sha256 "265091e145c453f37315d096074edf8e25ab1418848f2d9d82eb349b4cce1649"
  end
  on_intel do
    url "https://github.com/cordfuse/vyzr/releases/download/v0.9.1/Vyzr-#{version}.dmg"
    sha256 "80b3b979710eb849c1b223722e16f91488b7a86ae7ca0910d8687ebb33435936"
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
