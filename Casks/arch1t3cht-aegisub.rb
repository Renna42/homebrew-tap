cask "arch1t3cht-aegisub" do
  arch arm: "arm64", intel: "x86_64"

  version "3.4.1,migration02-01"
  sha256 arm:   "2487566e3b1aec275c87bc549063406f1adfaab3cd069eb3a6fcaa76916f6348",
         intel: "9aed3f4181c0f82a366bb224ab94bf074ea73cab863f85b51cf3ca59c088bc91"

  url "https://github.com/arch1t3cht/Aegisub/releases/download/#{version.csv.second}/macOS.#{arch}.Release.-.installer.zip"
  name "arch1t3cht's Aegisub \"fork\""
  desc "Cross-platform advanced subtitle editor, with new feature branches"
  homepage "https://github.com/arch1t3cht/Aegisub/"

  livecheck do
    url :url
    strategy :github_latest
  end

  conflicts_with cask: "aegisub"
  depends_on macos: ">= :ventura"

  app "Aegisub.app"

  uninstall quit: "com.aegisub.aegisub"

  zap trash: [
    "~/Library/Application Support/Aegisub",
    "~/Library/Preferences/com.aegisub.aegisub.plist",
    "~/Library/Saved Application State/com.aegisub.aegisub.savedState",
  ]
end
