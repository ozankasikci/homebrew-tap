cask "agent-sessions" do
  version "0.1.9"

  on_arm do
    sha256 "354faa191c844588cf653719c6a0663aa13e37e7344b3922161797a59adf7f9f"
    url "https://github.com/ozankasikci/agent-sessions/releases/download/v#{version}/AgentSessions_#{version}_aarch64.dmg"
  end

  on_intel do
    sha256 "430a12edb08d811dbeaf5496eaffa43b676be57e51f44619c60ba70e27915878"
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
