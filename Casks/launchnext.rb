cask "launchnext" do
  version "2.3.0"
  sha256 "ebb9788a48ff12bc8f8d2876f38907000cb92b86e0ec71dd823ef5389a515de4"

  url "https://github.com/RoversX/LaunchNext/releases/download/#{version}/LaunchNext#{version}.zip"
  name "LaunchNext"
  desc "Bring Launchpad back in MacOS26+, highly customizable, powerful, free"
  homepage "https://github.com/RoversX/LaunchNext/"

  app "LaunchNext.app"

  zap trash: "~/Library/Application Support/LaunchNext"
end
