cask "agent-sessions" do
  version "0.1.0"

  on_arm do
    sha256 "480d24780cbeb91192481f8ed725ecf17f0217a0dce411192b78c455db66b39b"
    url "https://github.com/ozankasikci/agent-sessions/releases/download/v#{version}/Agent.Sessions_#{version}_aarch64.dmg"
  end

  on_intel do
    sha256 "87eaa003366f6a490c2265f8b03339f120899927088ec5dda1b0216880cf8de0"
    url "https://github.com/ozankasikci/agent-sessions/releases/download/v#{version}/Agent.Sessions_#{version}_x64.dmg"
  end

  name "Agent Sessions"
  desc "macOS desktop app to monitor running Claude Code sessions"
  homepage "https://github.com/ozankasikci/agent-sessions"

  depends_on macos: ">= :monterey"

  app "Agent Sessions.app"

  zap trash: [
    "~/Library/Preferences/com.claude-sessions-viewer.plist",
    "~/Library/Saved Application State/com.claude-sessions-viewer.savedState",
  ]
end
