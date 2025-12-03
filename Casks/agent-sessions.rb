cask "agent-sessions" do
  version "0.1.6"

  on_arm do
    sha256 "8d6162e66a7bd0ab0a3cda4f993490f6e4038599757eb70788f4b6ea530dca91"
    url "https://github.com/ozankasikci/agent-sessions/releases/download/v#{version}/AgentSessions_#{version}_aarch64.dmg"
  end

  on_intel do
    sha256 "f666f6dd70a8d56f246700aeb0f8f8158212f36a2732d11300485a5c54aa0a2f"
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
