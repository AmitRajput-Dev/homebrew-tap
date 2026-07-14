cask "sonybridge" do
  version "0.3.0"
  sha256 "a98cbdb5561df8f20c92c8253cd17832d65f1dc0d99ea3e2871e7bc2da5a0218"

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
