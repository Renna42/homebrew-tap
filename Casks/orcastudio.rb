cask "orcastudio" do
  arch arm: "arm64", intel: "x86_64"

  version "02.07.01.57,p5"
  sha256 arm:   "789191cd8ae3ea071e0367008218520a63528a91cce7a7babc5c0cc56b1dabd6",
         intel: "0c105a90fa39cfed7a705f92aba7643ec67d4474bcc1e5f4618d0aa65a4f7d2d"

  url "https://github.com/jarczakpawel/OrcaStudio/releases/download/v#{version.csv.first}-#{version.csv.second}/BambuStudio-OrcaSlicer_Mac_#{arch}_V#{version.csv.first}.dmg"
  name "OrcaStudio"
  desc "Fork of Bambu Studio with OrcaSlicer changes applied"
  homepage "https://github.com/jarczakpawel/OrcaStudio"

  conflicts_with cask: "bambu-studio"
  depends_on macos: :big_sur

  app "BambuStudio.app"

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
