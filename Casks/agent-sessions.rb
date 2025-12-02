cask "agent-sessions" do
  version "0.1.0"
  sha256 "480d24780cbeb91192481f8ed725ecf17f0217a0dce411192b78c455db66b39b"

  url "https://github.com/ozankasikci/agent-sessions/releases/download/v#{version}/Agent.Sessions_#{version}_aarch64.dmg"
  name "Agent Sessions"
  desc "macOS desktop app to monitor running Claude Code sessions"
  homepage "https://github.com/ozankasikci/agent-sessions"

  depends_on macos: ">= :monterey"
  depends_on arch: :arm64

  app "Agent Sessions.app"

  zap trash: [
    "~/Library/Preferences/com.claude-sessions-viewer.plist",
    "~/Library/Saved Application State/com.claude-sessions-viewer.savedState",
  ]
end
