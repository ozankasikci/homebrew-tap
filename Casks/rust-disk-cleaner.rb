cask "rust-disk-cleaner" do
  version "0.1.0"

  on_arm do
    sha256 "852957ea9e6d845320a05c6dc7305499494b80146081e014964fd2900bf94a1b"
    url "https://github.com/ozankasikci/rust-disk-cleaner/releases/download/v#{version}/RustDiskCleaner_#{version}_aarch64.dmg"
  end

  on_intel do
    sha256 "afb209164188a7f14d78c648873867379728a6a143541007ef14d59b1cf9390e"
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
