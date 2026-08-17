cask "orcastudio" do
  arch arm: "arm64", intel: "x86_64"

  version "02.08.01.55,p3"
  sha256 arm:   "bf29502f5f2be58bc7a34ecf034f4617257b6121b261279851c38813c372d1cd",
         intel: "d323b2882664910b5e0f5bb3f5cd8da0b1edb695b83b7dfbb681a77b1d5195cd"

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
