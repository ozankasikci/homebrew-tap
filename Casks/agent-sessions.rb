cask "agent-sessions" do
  version "0.1.13"

  on_arm do
    sha256 "966643432c09dc16ff1b3d0bb8ef9a519f3fbc45770720bfa4ac8e2b152d659e"
    url "https://github.com/ozankasikci/agent-sessions/releases/download/v#{version}/AgentSessions_#{version}_aarch64.dmg"
  end

  on_intel do
    sha256 "36ed293983891e68d6c619ffaa07c11ba026bd047a0742f34238f00a56834e2d"
    url "https://github.com/ozankasikci/agent-sessions/releases/download/v#{version}/AgentSessions_#{version}_x64.dmg"
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
