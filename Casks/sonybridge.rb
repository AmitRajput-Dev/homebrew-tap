cask "sonybridge" do
  version "0.1.0"
  sha256 "b67c97c51a847a95a0ba2d9c70d14ff354b61fd75df539c8e71e8840b636c45f"

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
