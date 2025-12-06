cask "agent-sessions" do
  version "0.1.15"

  on_arm do
    sha256 "5cfff051f961e307b3cc0781982d061f1dbcb910648d2b5f567f60333e5945af"
    url "https://github.com/ozankasikci/agent-sessions/releases/download/v#{version}/AgentSessions_#{version}_aarch64.dmg"
  end

  on_intel do
    sha256 "8e60d29faab6ece59c8120a13b82f5fb5f9062bdf06d71a979532f69598d5bfd"
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
