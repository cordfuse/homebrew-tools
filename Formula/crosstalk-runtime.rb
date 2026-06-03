class CrosstalkRuntime < Formula
  desc "AI agent messaging daemon for Crosstalk transports"
  homepage "https://github.com/cordfuse/crosstalk-runtime"
  version "3.9.5"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/cordfuse/crosstalk-runtime/releases/download/v#{version}/crosstalk-darwin-arm64"
      sha256 "3188e9183e608181186c006234db45204317a9f9095530442b435217cc4bffae"
    end
    on_intel do
      url "https://github.com/cordfuse/crosstalk-runtime/releases/download/v#{version}/crosstalk-darwin-x64"
      sha256 "b166e709f2096901f16f51dfeda408fd0f80365e728724fb2641a0d1815af122"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/cordfuse/crosstalk-runtime/releases/download/v#{version}/crosstalk-linux-x64"
      sha256 "658d51f9bfc7dfc8265a166cde20483251f5a72d4206bfc702202f36f5afab05"
    end
    on_arm do
      url "https://github.com/cordfuse/crosstalk-runtime/releases/download/v#{version}/crosstalk-linux-arm64"
      sha256 "1c6b812c23c43dbdc8a77f71c853e0a1f83be10bb2e2749fdf60356265acdd29"
    end
  end

  depends_on "git"

  def install
    bin.install Dir["crosstalk-*"].first => "crosstalk"
  end

  service do
    run [opt_bin/"crosstalk", "--config", "/etc/crosstalk/config.yaml"]
    keep_alive true
    log_path "/var/log/crosstalk.log"
    error_log_path "/var/log/crosstalk.log"
    environment_variables(
      HOME: "/var/lib/crosstalk",
      GIT_SSH_COMMAND: "ssh -i /var/lib/crosstalk/.ssh/id_ed25519 -o StrictHostKeyChecking=accept-new -o UserKnownHostsFile=/var/lib/crosstalk/.ssh/known_hosts"
    )
  end

  def post_install
    # Directories
    (Pathname.new("/etc/crosstalk")).mkpath
    (Pathname.new("/var/lib/crosstalk/transports")).mkpath
    (Pathname.new("/var/lib/crosstalk/.ssh")).mkpath

    # Default config
    config = Pathname.new("/etc/crosstalk/config.yaml")
    config.write("transports: []\n") unless config.exist?

    # Create _crosstalk system user on macOS
    if OS.mac?
      system "dscl", ".", "-read", "/Users/_crosstalk", out: File::NULL, err: File::NULL
    end
  rescue
    # Non-fatal — user may need to run with sudo for system dirs
    opoo "Could not create system directories — run `sudo brew postinstall crosstalk-runtime` to complete setup"
  end

  def caveats
    <<~EOS
      Add the SSH public key from /var/lib/crosstalk/.ssh/id_ed25519.pub as a
      deploy key (read/write) on your transport repo, then:

        sudo crosstalk add-transport <git-url>
        sudo brew services start cordfuse/tap/crosstalk-runtime

      For a system-level daemon (starts at boot, survives logout):
        sudo brew services start cordfuse/tap/crosstalk-runtime
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/crosstalk --version")
  end
end
