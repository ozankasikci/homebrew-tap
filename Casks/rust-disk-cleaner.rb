cask "rust-disk-cleaner" do
  version "0.2.2"
  sha256 "6fef858560e6fe2e6a91a9c857f1991ee5cedc6cd62ba654f38ebe928927ca5e"

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
