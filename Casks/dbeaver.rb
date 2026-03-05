cask "dbeaver" do
  arch arm: "aarch64", intel: "x86_64"

  version "26.0.0"
  sha256 arm:   "5b31d585a6dc2179e87625c1ff97c50aef7b61c3e26c1e8ddb59bfed3f3f6aaa",
         intel: "1b55efe27b9c6f4b828dba12d6bbed7f2eab8b4a073c7666bbe8de6bd3c2e90e"

  url "https://github.com/dbeaver/dbeaver/releases/download/#{version}/dbeaver-ce-#{version}-macos-#{arch}.dmg",
      verified: "github.com/dbeaver/dbeaver/"
  name "DBeaver"
  desc "Free Open-Source Database Management Tool"
  homepage "https://dbeaver.io/"

  depends_on macos: ">= :big_sur"

  app "DBeaver.app"

  zap trash: "~/Library/DBeaverData/"
end
