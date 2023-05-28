#!/usr/bin/env bash

set -euo pipefail

#
# Basic bash script that allows for building AUR packages
#

# Packages to install from AUR
PACKAGE_NAMES=(

)

# Where built packages go
BUILD_PATH="$1"
# Where the PKGBUILD files get stored
PKG_PATH="$2"

mkdir -p "$BUILD_PATH"
mkdir -p "$PKG_PATH"
cd "$PKG_PATH"

for i in "${PACKAGE_NAMES[@]}"
do
    echo "START BUILDING: $i"
    paru -G "$i"
    cd "$i"
    PKGDEST="$BUILD_PATH" paru -U
    cd ..
    echo "FINISHED BUILDING: $i"
done
