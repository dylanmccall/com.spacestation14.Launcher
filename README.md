# Space Station 14

This repo hosts an unofficial flatpak for
[Space Station 14](https://spacestation14.io/), the multiplayer disaster
simulator.

## Building

To build and install this project locally, use `flatpak-builder`:

    flatpak-builder build-dir io.spacestation14.Launcher.yaml --force-clean --repo=repo --install --user

## Creating a release

To update the version of SS14.Launcher, please update the tag specified in `modules/sources/ss14-launcher-git.yaml`. Next, update the nuget sources by using `update-nuget-sources.sh`, providing that same tag as the first parameter:

    ./tools/update-nuget-sources.sh v0.13.2

Finally, remember to add information about the new release to `modules/data/io.spacestation14.Launcher.appdata.xml`.

## Authors

- Dylan McCall <dylan@dylanmccall.ca>
