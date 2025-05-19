#!/bin/bash
set -euo pipefail

# make temp working directory
echo "Creating temporary working directory..."
tmp_dir=/tmp/proton-ge-custom
rm -rf "$tmp_dir"
mkdir "$tmp_dir"
cd "$tmp_dir"

# download tarball
echo "Fetching tarball URL..."
tarball_url=$(curl -s https://api.github.com/repos/GloriousEggroll/proton-ge-custom/releases/latest | grep browser_download_url | cut -d\" -f4 | grep .tar.gz)
tarball_name=$(basename "$tarball_url")

echo "Downloading tarball: $tarball_name..."
curl -# -L "$tarball_url" -o "$tarball_name"

# download checksum
echo "Fetching checksum URL..."
checksum_url=$(curl -s https://api.github.com/repos/GloriousEggroll/proton-ge-custom/releases/latest | grep browser_download_url | cut -d\" -f4 | grep .sha512sum)
checksum_name=$(basename "$checksum_url")

echo "Downloading checksum: $checksum_name..."
curl -# -L "$checksum_url" -o "$checksum_name" --no-progress-meter

# check tarball with checksum
echo "Verifying tarball $tarball_name with checksum $checksum_name..."
sha512sum -c "$checksum_name"

# if result is ok, continue

# make steam directory if it does not exist
echo "Creating Steam directory if it does not exist..."
proton_dir=~/.steam/root/compatibilitytools.d/Proton-GE
mkdir -p "$proton_dir"

# extract proton tarball to steam directory
echo "Extracting $tarball_name to Steam directory..."
rm -rf "$proton_dir"/*
tar -xf "$tarball_name" -C ~/.steam/root/compatibilitytools.d/Proton-GE --strip-components=1
# replace these to prevent steam from reverting to defaults when a version no longer exists
sed -i -r 's|"GE-Proton.*"|"Proton-GE"|' "$proton_dir"/compatibilitytool.vdf
echo "All done :)"
