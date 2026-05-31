class CrosstalkRuntime < Formula
  desc "AI agent messaging daemon for Crosstalk transports"
  homepage "https://github.com/cordfuse/crosstalk-runtime"
  version "3.0.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/cordfuse/crosstalk-runtime/releases/download/v#{version}/crosstalk-darwin-arm64"
      sha256 "PLACEHOLDER_DARWIN_ARM64"
    end
    on_intel do
      url "https://github.com/cordfuse/crosstalk-runtime/releases/download/v#{version}/crosstalk-darwin-x64"
      sha256 "PLACEHOLDER_DARWIN_X64"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/cordfuse/crosstalk-runtime/releases/download/v#{version}/crosstalk-linux-x64"
      sha256 "PLACEHOLDER_LINUX_X64"
    end
    on_arm do
      url "https://github.com/cordfuse/crosstalk-runtime/releases/download/v#{version}/crosstalk-linux-arm64"
      sha256 "PLACEHOLDER_LINUX_ARM64"
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
