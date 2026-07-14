cask "sonybridge" do
  version "0.1.2"
  sha256 "4448b15bb7e164c3b8b18657769e50953539b46904556793e9432831e1b6f147"

  url "https://github.com/AmitRajput-Dev/SonyBridge/releases/download/v#{version}/SonyBridge-macOS.zip"
  name "SonyBridge"
  desc "Control Sony headphones (noise cancelling, ambient sound, EQ, battery) from macOS"
  homepage "https://github.com/AmitRajput-Dev/SonyBridge"

  depends_on macos: :big_sur

  app "SonyBridge.app"

  # App is ad-hoc signed (not notarized); clear quarantine so it launches without a Gatekeeper block.
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/SonyBridge.app"]
  end

  caveats <<~EOS
    Connect your Sony headphones in macOS Bluetooth settings, then open SonyBridge.
    If macOS still blocks it, run:
      xattr -dr com.apple.quarantine "#{appdir}/SonyBridge.app"
  EOS
end
