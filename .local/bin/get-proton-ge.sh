#!/bin/bash
set -euo pipefail

echo "Creating temporary working directory..."
tmp_dir=/tmp/proton-ge-custom
rm -rf "$tmp_dir"
mkdir "$tmp_dir"
cd "$tmp_dir"

echo "Fetching tarball URL..."
tarball_url=$(curl -s https://api.github.com/repos/GloriousEggroll/proton-ge-custom/releases/latest | grep browser_download_url | cut -d\" -f4 | grep .tar.gz)
tarball_name=$(basename "$tarball_url")

echo "Downloading tarball: $tarball_name..."
curl -# -L "$tarball_url" -o "$tarball_name"

echo "Fetching checksum URL..."
checksum_url=$(curl -s https://api.github.com/repos/GloriousEggroll/proton-ge-custom/releases/latest | grep browser_download_url | cut -d\" -f4 | grep .sha512sum)
checksum_name=$(basename "$checksum_url")

echo "Downloading checksum: $checksum_name..."
curl -# -L "$checksum_url" -o "$checksum_name" --no-progress-meter

echo "Verifying tarball $tarball_name with checksum $checksum_name..."
sha512sum -c "$checksum_name"

# if result is ok, continue

echo "Creating Steam directory if it does not exist..."
proton_dir=~/.steam/steam/compatibilitytools.d/Proton-GE
mkdir -p "$proton_dir"

echo "Extracting $tarball_name to Steam directory..."
rm -rf "$proton_dir"/*
tar -xf "$tarball_name" -C "$proton_dir" --strip-components=1
# replace these to prevent steam from reverting to defaults when a version no longer exists
sed -i -r 's|"GE-Proton.*"|"Proton-GE"|' "$proton_dir"/compatibilitytool.vdf
echo "All done :)"
