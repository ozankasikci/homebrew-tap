cask "todo-assistant" do
  version "0.1.0"

  on_arm do
    sha256 "36c1474a6525e052f554f1003d8afc148e9adfa96b7e95139fef6bedbfe45791"
    url "https://github.com/ozankasikci/todo-assistant/releases/download/v#{version}/ToDoAssistant_#{version}_aarch64.dmg"
  end

  on_intel do
    sha256 "20edb93cdff2aeceb76cda1aeb70b7a7ad0f30dd2bba6cbed64b564291d1285e"
    url "https://github.com/ozankasikci/todo-assistant/releases/download/v#{version}/ToDoAssistant_#{version}_x64.dmg"
  end

  name "To Do Assistant"
  desc "Task management app with AI assistant powered by Claude"
  homepage "https://github.com/ozankasikci/todo-assistant"

  depends_on macos: ">= :monterey"

  app "To Do Assistant.app"

  zap trash: [
    "~/Library/Preferences/com.kasikci.todoassistant.plist",
    "~/Library/Saved Application State/com.kasikci.todoassistant.savedState",
    "~/Library/Application Support/com.kasikci.todoassistant",
  ]
end
