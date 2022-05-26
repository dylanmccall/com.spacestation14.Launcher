#!/bin/bash -x

TOOLS_DIR=$(dirname "$(realpath "$0")")
BASE_DIR=$(realpath "${TOOLS_DIR}/..")

FLATPAK_DOTNET_GENERATOR=$(readlink -e "${BASE_DIR}/flatpak-builder-tools/dotnet/flatpak-dotnet-generator.py")

SS14_BRANCH=${1:?No SS14.Launcher version specified}

WORK_DIR="${BASE_DIR}/.update-nuget-sources"
CHECKOUT_DIR="${WORK_DIR}/SS14.Launcher"

function cleanup {
    rm -rf "${WORK_DIR}"
}

trap cleanup EXIT

rm -rf "${CHECKOUT_DIR}"
mkdir -p "${CHECKOUT_DIR}"
git clone "https://github.com/space-wizards/SS14.Launcher.git" "${CHECKOUT_DIR}" --branch="${SS14_BRANCH}" --depth=1 --recurse-submodules

pushd "${CHECKOUT_DIR}" || exit
"${FLATPAK_DOTNET_GENERATOR}" "${BASE_DIR}/modules/sources/space-station-14-launcher-nuget-sources.json" "SS14.Launcher/SS14.Launcher.csproj"
"${FLATPAK_DOTNET_GENERATOR}" "${BASE_DIR}/modules/sources/space-station-14-loader-nuget-sources.json" "SS14.Loader/SS14.Loader.csproj"
popd || exit
