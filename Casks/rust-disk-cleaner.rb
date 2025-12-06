cask "rust-disk-cleaner" do
  version "0.2.3"
  sha256 "e1eb0198369951c5f4241f9f0ca5adf532da4cbcf332d505fa24b3ac1cb407cf"

  url "https://github.com/ozankasikci/rust-disk-cleaner/releases/download/v#{version}/RustDiskCleaner_#{version}_aarch64.dmg"

  depends_on arch: :arm64

  name "RustDiskCleaner"
  desc "Fast disk space analyzer and cleaner for macOS"
  homepage "https://github.com/ozankasikci/rust-disk-cleaner"

  app "RustDiskCleaner.app"

  zap trash: [
    "~/Library/Preferences/com.ozan.rustdiskcleaner.plist",
    "~/Library/Saved Application State/com.ozan.rustdiskcleaner.savedState",
  ]
end
