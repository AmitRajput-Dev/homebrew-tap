cask "sonybridge" do
  version "0.4.0"
  sha256 "8406d4fc7455407cf005adb75192dd7a0da89e694473ff7075c19e732a5d0992"

  url "https://github.com/AmitRajput-Dev/SonyBridge/releases/download/v#{version}/SonyBridge-macOS.zip"
  name "SonyBridge"
  desc "Control Sony headphones: noise cancelling, ambient sound, EQ and battery"
  homepage "https://github.com/AmitRajput-Dev/SonyBridge"

  depends_on :macos

  app "SonyBridge.app"

  # App is ad-hoc signed (not notarized); clear quarantine so it launches without a Gatekeeper block.
  postflight_steps do
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "{{appdir}}/SonyBridge.app"]
  end

  caveats <<~EOS
    Connect your Sony headphones in macOS Bluetooth settings, then open SonyBridge.
    If macOS still blocks it, run:
      xattr -dr com.apple.quarantine "#{appdir}/SonyBridge.app"
  EOS
end
