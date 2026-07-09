cask "arch1t3cht-aegisub" do
  arch arm: "arm64", intel: "x86_64"

  version "3.4.1,migration03-02"
  sha256 arm:   "decf40001eb4fc533395371c37c0ac6552471f1f9cfcb43893c15136eed58d13",
         intel: "20ca893b48b48d6c02aaca1a7804743e354cb7ded6fde98c726c867dd51b66f1"

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
