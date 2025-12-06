cask "agent-sessions" do
  version "0.1.16"

  on_arm do
    sha256 "c428e3ec066ca93f92de96cfb29624dcd8eaeebed7c8363ecda11d0e7fa163ec"
    url "https://github.com/ozankasikci/agent-sessions/releases/download/v#{version}/AgentSessions_#{version}_aarch64.dmg"
  end

  on_intel do
    sha256 "d0e5e308e87fb666b763bf6960975ce269ad604caf161540ad14180011eb2f04"
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
