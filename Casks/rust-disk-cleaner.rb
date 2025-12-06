cask "rust-disk-cleaner" do
  version "0.2.0"

  on_arm do
    sha256 "7467d3c554e803744e9bb41081287203b3d193baf4fe4e355e9e2597d8de9845"
    url "https://github.com/ozankasikci/rust-disk-cleaner/releases/download/v#{version}/RustDiskCleaner_#{version}_aarch64.dmg"
  end

  on_intel do
    sha256 "863514718f45f9d84eb2840eacdf43a7f70a9a1e6ae77e71bb9f72336dc1c8dd"
    url "https://github.com/ozankasikci/rust-disk-cleaner/releases/download/v#{version}/RustDiskCleaner_#{version}_x64.dmg"
  end

  name "RustDiskCleaner"
  desc "Fast disk space analyzer and cleaner for macOS"
  homepage "https://github.com/ozankasikci/rust-disk-cleaner"

  depends_on macos: ">= :monterey"

  app "RustDiskCleaner.app"

  zap trash: [
    "~/Library/Preferences/com.ozan.rustdiskcleaner.plist",
    "~/Library/Saved Application State/com.ozan.rustdiskcleaner.savedState",
  ]
end
