cask "orcastudio" do
  arch arm: "arm64", intel: "x86_64"

  version "02.08.01.55,p6"
  sha256 arm:   "a76a06e5afdd5123f37681d0b1ddfb7b0bebe872bbb129efc6e4bd896a986627",
         intel: "cf51a1eea5000c1442ba5cdc90ec4015de99e810f5f4da1baf2dba623224bb47"

  url "https://github.com/jarczakpawel/OrcaStudio/releases/download/v#{version.csv.first}-#{version.csv.second}/OrcaStudio_Mac_#{arch}_V#{version.csv.first}-#{version.csv.second}.dmg"
  name "OrcaStudio"
  desc "Fork of Bambu Studio with OrcaSlicer changes applied"
  homepage "https://github.com/jarczakpawel/OrcaStudio"

  depends_on macos: :big_sur

  app "OrcaStudio.app"

  uninstall script: {
    executable: "/bin/bash",
    args:       [
      "-c",
      <<~EOS,
        LIMACTL="$HOME/Library/Application Support/BambuStudio_OrcaSlicer/slicer-linux-runtime/lima/bin/limactl"
        if [ -x "$LIMACTL" ]; then
            "$LIMACTL" stop slicer-linux-runtime 2>/dev/null || true
            "$LIMACTL" delete -f slicer-linux-runtime 2>/dev/null || true
        elif command -v limactl >/dev/null 2>&1; then
            limactl stop slicer-linux-runtime 2>/dev/null || true
            limactl delete -f slicer-linux-runtime 2>/dev/null || true
        fi
        rm -rf "$HOME/Library/Application Support/BambuStudio_OrcaSlicer/slicer-linux-runtime"
      EOS
    ],
  }

  zap trash: [
    "~/Library/Application Support/BambuStudio_OrcaSlicer",
    "~/Library/Caches/com.orcaslicer.BambuStudio",
    "~/Library/HTTPStorages/com.orcaslicer.BambuStudio.binarycookies",
    "~/Library/Preferences/com.orcaslicer.BambuStudio.plist",
    "~/Library/Saved Application State/com.orcaslicer.BambuStudio.savedState",
    "~/Library/WebKit/com.orcaslicer.BambuStudio",
  ]
end
