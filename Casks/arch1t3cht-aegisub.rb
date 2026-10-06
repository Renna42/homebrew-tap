cask "arch1t3cht-aegisub" do
  arch arm: "arm64", intel: "x86_64"

  version "3.5.0,migration05-01"
  sha256 arm:   "a82fbdd2e8f2970acc3a3e18962874fe1d03cfd4a4c4d1446af5c354c7ca67f7",
         intel: "349d44e50c3f669ffb53def044f4c9cb479be0007e6f7f1eada4aba08ce8a800"

  url "https://github.com/arch1t3cht/Aegisub/releases/download/#{version.csv.second}/macOS.#{arch}.Release.-.ad-hoc.installer.zip"
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
