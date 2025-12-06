cask "rust-disk-cleaner" do
  version "0.2.1"
  sha256 "3d6960d2a58e382af93dbeb5942177e466fe4c1094cf6c14b5e4c80d51f93ef7"

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
