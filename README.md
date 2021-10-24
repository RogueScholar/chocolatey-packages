# Chocolatey Packages

<!--
  SPDX-FileCopyrightText: © 2020-2021 Nicholas Smith <nsmith@ethosgroup.com>
  SPDX-FileCopyrightText:  2021 Peter J. Mello <admin@petermello.net>

  SPDX-License-Identifier: Apache-2.0

[Update status][update-gist]
-->
[![AppVeyor Status Badge][appveyor-badge]][appveyor-page]

This repository contains Chocolatey packages that are (mostly) automatically
maintained. The automatic update process is handled by
[AU (Automatic Updater)][choco-au], a supported tool in the Chocolatey community
for automatic packaging.

## Packages

- [![Chocolatey package][altserver-badge]][altserver-choco]
  ([**`altserver`**][altserver]) /
  [![Chocolatey package][altserver.install-badge]][altserver.install-choco]
  ([**`altserver.install`**][altserver.install]): [AltStore][altstore] is a home
  for apps that push the boundaries of iOS; no jailbreak required.
- [![Chocolatey package][coolterm-badge]][coolterm-choco]
  ([**`coolterm`**][coolterm]): [CoolTerm][coolterm-web] is a simple serial port
  terminal application (no terminal emulation) written in Xojo that is geared
  towards hobbyists and professionals with a need to exchange data with hardware
  connected to serial ports such as servo controllers, robotic kits, GPS
  receivers, micro-controllers, etc.
- [![Chocolatey package][hledger-badge]][hledger-choco]
  ([**`hledger`**][hledger]): [hledger][hledger-web] is free, cross-platform
  accounting software for both power users and folks new to accounting. It's
  good for tracking money, time, investments, cryptocurrencies, inventory and
  more, with high accuracy, flexibility and privacy.
- [![Chocolatey package][hyperspace-badge]][hyperspace-choco]
  ([**`hyperspace`**][hyperspace]): [Hyperspace][hyperspace-web] is the next
  generation of the fluffiest client for the Fediverse (Mastodon, et al.).
- [![Chocolatey package][ledger-badge]][ledger-choco] ([**`ledger`**][ledger]):
  [Ledger][ledger-web] is a powerful, double-entry accounting system that is
  accessed from the POSIX command line.
- [![Chocolatey package][openhardwaremonitor-badge]][openhardwaremonitor-choco]
  ([**`openhardwaremonitor`**][openhardwaremonitor]): The
  [Open Hardware Monitor][openhardwaremonitor-web] is free, open source software
  that monitors the temperature sensors, fan speeds, voltages, load and clock
  speeds of a computer.
- [![Chocolatey package][thedesk-badge]][thedesk-choco]
  ([**`thedesk`**][thedesk]) /
  [![Chocolatey package][thedesk.portable-badge]][thedesk.portable-choco]
  ([**`thedesk.portable`**][thedesk.portable]): [TheDesk][thedesk-web] is a
  power client for the Fediverse (Mastodon, et al.) in the style of Tweetdeck's
  feature set for highly customized interactions with Twitter. It has built-in
  support for unique aspects of several Fediverse instances that cater to East
  Asian users while remaining capable of connecting to them all and is in highly
  active development.
- [![Chocolatey package][whalebird-badge]][whalebird-choco]
  ([**`whalebird`**][whalebird]): [Whalebird][whalebird-web] is a Mastodon,
  Pleroma, and Misskey theme-able desktop client with support for multiple
  accounts of each, built using Electron.

## Folder Structure

- [automatic][dir-auto] - Where automatic packaging and packages are kept.
- [icons][dir-ico] - Where icon files for the packages are kept to reduce issues
  when packages themselves move around.
- [setup][dir-setup] - Items for prepping the system to ensure for auto
  packaging.
- [tools][dir-ops] - Scripts, jobs, and other items for ensuring automatic
  packaging.

For setting up your own automatic package repository, please see
[Automatic Packaging][choco-autopkg]

## Requirements

- Chocolatey (choco.exe)

### AU

- PowerShell v5+.
- The [AU module][choco-au].

For daily operations check out the AU packages
[template README][template-readme].

### Recommendation on Auto Packaging

AU provides more in the process of being completely automated, sending emails
when things go wrong, and providing a nice report at the end. It doesn't have a
bolt-on feeling to it that you see with Ketarin / ChocolateyPackageUdater,
however the one thing it does lack in comparison is no visual feedback to seeing
how searches for installers may be found. Other than that, it provides errors
when things go wrong, where Ketarin doesn't consider anything that happens
during "before run"/"post run updates" (where chocopkgup and checksumming occur)
to be an error, even if those scripts error.

So for best visibility, enjoying the ease of using AppVeyor, and for a nice
report of results, we recommend AU over Ketarin. You also don't need to deal
with templates as AU works directly with the xml/ps1 files to do replacement.

### Adapting your current source repository to this source repository template

You want to bring in all of your packages into the proper folders. We suggest
using some sort of diffing tool to look at the differences between your current
solution and this solution and then making adjustments to it. Pay special
attention to the setup folder.

1. Bring over the following files to your package source repository:
   - `automatic\README.md`
   - `icons\README.md`
   - `ketarin\README.md`
   - `ketarin\_KetarinChocolateyTemplate.xml`
   - `manual\README.md`
   - `ops\*.*`
   - `setup\*.*`
   - `.appveyor.yml`
1. Inspect the following file and add the differences:
   - `.gitignore`

### Use Both Methodologies

The way this source repository is designed, you can use both AU and
Ketarin/ChocolateyPackageUpdater together. This is especially helpful when
migrating existing packages from one methodology to the other.

### Migrating existing Ketarin packages to AU

1. Add an update.ps1 to the package folder and determine how to update the
   package using [AU's instructions][au-script].
1. Remove the ketarin.xml file from the ketarin folder.
1. Ensure you also remove the package job from Ketarin itself as it doesn't
   automatically remove.

### Special Notes

#### Ketarin

- In `Settings -> Global variables` the variable `autoPackagesFolder` is used to
  determine where your automatic packages are. It doesn't matter what
  `chocopkgup` is using, this folder is passed through. Ensure this is set
  appropriately.
- In `Settings -> Global variables` the variable `saveDir` is used to determine
  where to save the downloaded files from Ketarin. Please ensure the folder
  exists.
- In `Settings -> Global variables` the variable `nopush` is set to `--nopush`,
  which allows checksum calculations to occur and then a custom script will push
  the files.
- In `Settings -> Global variables` the variable `cscript` is set to `2`, which
  means calculate checksums, rebuild, and push the packages. If you set this to
  `1` it will do everything except push the packages. Setting this to `1` is how
  you disable package pushing.
- In `Settings -> Global variables` the variable `checksum` is set to
  `{checksum}`. Do not change this, this is how the post update script replaces
  the literal value `{checksum}`. The same goes for `checksumx64`,
  `packageGuid`, and `url64`.

[appveyor-badge]: https://ci.appveyor.com/api/projects/status/github/FullofQuarks/chocolatey-packages?svg=true
[appveyor-page]: https://ci.appveyor.com/project/FullofQuarks/chocolatey-packages
[update-gist]: https://gist.github.com/YOUR_GITHUB_USERNAME_HERE/YOUR_GIST_ID
[choco-au]: https://chocolatey.org/packages/au
[altserver]: automatic/altserver/altserver.nuspec
[altserver-badge]: https://img.shields.io/chocolatey/v/altserver?color=seagreen&include_prereleases&label=altserver&logo=chocolatey&style=for-the-badge
[altserver-choco]: https://community.chocolatey.org/packages/altserver
[altserver.install]: automatic/altserver.install/altserver.install.nuspec
[altserver.install-badge]: https://img.shields.io/chocolatey/v/altserver.install?color=seagreen&include_prereleases&label=altserver.install&logo=chocolatey&style=for-the-badge
[altserver.install-choco]: https://community.chocolatey.org/packages/altserver.install
[altstore]: https://altstore.io/
[coolterm]: automatic/coolterm/coolterm.nuspec
[coolterm-badge]: https://img.shields.io/chocolatey/v/coolterm?color=seagreen&include_prereleases&label=coolterm&logo=chocolatey&style=for-the-badge
[coolterm-choco]: https://community.chocolatey.org/packages/coolterm
[coolterm-web]: https://freeware.the-meiers.org
[hledger]: automatic/hledger/hledger.nuspec
[hledger-badge]: https://img.shields.io/chocolatey/v/hledger?color=seagreen&include_prereleases&label=hledger&logo=chocolatey&style=for-the-badge
[hledger-choco]: https://community.chocolatey.org/packages/hledger
[hledger-web]: https://hledger.org/
[hyperspace]: automatic/hyperspace/hyperspace.nuspec
[hyperspace-badge]: https://img.shields.io/chocolatey/v/hyperspace?color=seagreen&include_prereleases&label=hyperspace&logo=chocolatey&style=for-the-badge
[hyperspace-choco]: https://community.chocolatey.org/packages/hyperspace
[hyperspace-web]: https://hyperspace.marquiskurt.net/
[ledger]: automatic/ledger/ledger.nuspec
[ledger-badge]: https://img.shields.io/chocolatey/v/ledger?color=seagreen&include_prereleases&label=ledger&logo=chocolatey&style=for-the-badge
[ledger-choco]: https://community.chocolatey.org/packages/ledger
[ledger-web]: https://www.ledger-cli.org/
[openhardwaremonitor]: automatic/openhardwaremonitor/openhardwaremonitor.nuspec
[openhardwaremonitor-badge]: https://img.shields.io/chocolatey/v/openhardwaremonitor?color=seagreen&include_prereleases&label=openhardwaremonitor&logo=chocolatey&style=for-the-badge
[openhardwaremonitor-choco]: https://community.chocolatey.org/packages/openhardwaremonitor
[openhardwaremonitor-web]: https://openhardwaremonitor.org/
[thedesk]: automatic/thedesk/thedesk.nuspec
[thedesk-badge]: https://img.shields.io/chocolatey/v/thedesk?color=seagreen&include_prereleases&label=thedesk&logo=chocolatey&style=for-the-badge
[thedesk-choco]: https://community.chocolatey.org/packages/thedesk
[thedesk.portable]: automatic/thedesk.portable/thedesk.portable.nuspec
[thedesk.portable]: https://img.shields.io/chocolatey/v/thedesk.portable?color=seagreen&include_prereleases&label=thedesk.portable&logo=chocolatey&style=for-the-badge
[thedesk.portable-choco]: https://community.chocolatey.org/packages/thedesk.portable
[thedesk-web]: https://thedesk.top/en/
[whalebird]: automatic/whalebird/whalebird.nuspec
[whalebird-badge]: https://img.shields.io/chocolatey/v/whalebird?color=seagreen&include_prereleases&label=whalebird&logo=chocolatey&style=for-the-badge
[whalebird-choco]: https://community.chocolatey.org/packages/whalebird
[whalebird-web]: https://whalebird.social/en/desktop/contents
[dir-auto]: automatic
[dir-ico]: icons
[dir-setup]: setup
[dir-ops]: tools
[choco-autopkg]: https://docs.chocolatey.org/en-us/create/automatic-packages
[template-readme]: https://github.com/majkinetor/au-packages-template/blob/master/README.md
[au-script]: https://github.com/majkinetor/au#creating-the-package-updater-script
