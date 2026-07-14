cask "arch1t3cht-aegisub" do
  arch arm: "arm64", intel: "x86_64"

  version "3.4.1,migration04-01"
  sha256 arm:   "2cb46b2dd36e60511c0f459d83a8b3507696ce27dfce4a651fcfd89c88b603a9",
         intel: "cad2f034e8f685e61ce6eede6f342de62cc44719cdbac7ca2b28b0fabb02e4c2"

  url "https://github.com/arch1t3cht/Aegisub/releases/download/#{version.csv.second}/macOS.#{arch}.Release.-.installer.zip"
  name "arch1t3cht's Aegisub \"fork\""
  desc "Cross-platform advanced subtitle editor, with new feature branches"
  homepage "https://github.com/arch1t3cht/Aegisub/"

  conflicts_with cask: "aegisub"
  depends_on macos: :ventura

  app "Aegisub.app"

  uninstall quit: "com.aegisub.aegisub"

  zap trash: [
    "~/Library/Application Support/Aegisub",
    "~/Library/Preferences/com.aegisub.aegisub.plist",
    "~/Library/Saved Application State/com.aegisub.aegisub.savedState",
  ]
end
