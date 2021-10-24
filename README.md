# Chocolatey Packages

<!--
  SPDX-FileCopyrightText: © 2020-2021 Nicholas Smith <nsmith@ethosgroup.com>
  SPDX-FileCopyrightText:  2021 Peter J. Mello <admin@petermello.net>

  SPDX-License-Identifier: Apache-2.0
-->[![Update status][gist-badge]][update-gist]
[![AppVeyor Status Badge][appveyor-badge]][appveyor-page]

This repository contains [Chocolatey packages][comm-repo] that are (mostly)
[automatically maintained][auto-pkgs]. The automatic update process is handled
by the [AU (Automatic Updater)][choco-au] PowerShell module, a supported tool in
the Chocolatey community for automatic packaging.

## Packages

|   Icon   |       Package       |                 Description                 |
|----------|---------------------|---------------------------------------------|
|[<img src="https://cdn.statically.io/gh/RogueScholar/chocolatey-packages/master/icons/altserver.png" width="32" height="32" />][altserver]|[![Chocolatey package: altserver][altserver-badge]][altserver-choco]|[AltStore][altstore] is a home for apps that push the boundaries of iOS; no jailbreak required.|
|[<img src="https://cdn.statically.io/gh/RogueScholar/chocolatey-packages/master/icons/altserver.png" width="32" height="32" />][altserver.install]|[![Chocolatey package: altserver.install][altserver.install-badge]][altserver.install-choco]|[AltStore][altstore] is a home for apps that push the boundaries of iOS; no jailbreak required.|
|[<img src="https://cdn.statically.io/gh/RogueScholar/chocolatey-packages/master/icons/coolterm.png" width="32" height="32" />][coolterm]|[![Chocolatey package: coolterm][coolterm-badge]][coolterm-choco]|[CoolTerm][coolterm-web] is a simple serial port terminal application (no terminal emulation) written in Xojo that is geared towards hobbyists and professionals with a need to exchange data with hardware connected to serial ports such as servo controllers, robotic kits, GPS receivers, micro-controllers, etc.|
|[<img src="https://cdn.statically.io/gh/RogueScholar/chocolatey-packages/master/icons/hledger.png" width="32" height="32" />][hledger]|[![Chocolatey package: hledger][hledger-badge]][hledger-choco]|[hledger][hledger-web] is free, cross-platform accounting software for both power users and folks new to accounting. It's good for tracking money, time, investments, cryptocurrencies, inventory and more, with high accuracy, flexibility and privacy.|
|[<img src="https://cdn.statically.io/gh/RogueScholar/chocolatey-packages/master/icons/hyperspace.png" width="32" height="32" />][hyperspace]|[![Chocolatey package: hyperspace][hyperspace-badge]][hyperspace-choco]|[Hyperspace][hyperspace-web] is the next generation of the fluffiest client for the Fediverse (Mastodon, et al.).|
|[**`ledger`**][ledger]|[![Chocolatey package: ledger][ledger-badge]][ledger-choco]|[Ledger][ledger-web] is a powerful, double-entry accounting system that is accessed from the POSIX command line.|
|[<img src="https://cdn.statically.io/gh/RogueScholar/chocolatey-packages/master/icons/openhardwaremonitor.png" width="32" height="32" />][openhardwaremonitor]|[![Chocolatey package: openhardwaremonitor][openhardwaremonitor-badge]][openhardwaremonitor-choco]|The [Open Hardware Monitor][openhardwaremonitor-web] is free, open source software that monitors the temperature sensors, fan speeds, voltages, load and clock speeds of a computer.|
|[<img src="https://cdn.statically.io/gh/RogueScholar/chocolatey-packages/master/icons/thedesk.png" width="32" height="32" />][thedesk]|[![Chocolatey package: thedesk][thedesk-badge]][thedesk-choco]|[TheDesk][thedesk-web] is a power client for the Fediverse (Mastodon, et al.) in the style of Tweetdeck's feature set for highly customized interactions with Twitter. It has built-in support for unique aspects of several Fediverse instances that cater to East Asian users while remaining capable of connecting to them all and is in highly active development.|
|[<img src="https://cdn.statically.io/gh/RogueScholar/chocolatey-packages/master/icons/thedesk.png" width="32" height="32" />][thedesk.portable]|[![Chocolatey package: thedesk.portable][thedesk.portable-badge]][thedesk.portable-choco]|[TheDesk][thedesk-web] is a power client for the Fediverse (Mastodon, et al.) in the style of Tweetdeck's feature set for highly customized interactions with Twitter. It has built-in support for unique aspects of several Fediverse instances that cater to East Asian users while remaining capable of connecting to them all and is in highly active development.|
|[<img src="https://cdn.statically.io/gh/RogueScholar/chocolatey-packages/master/icons/whalebird.png" width="32" height="32" />][whalebird]|[![Chocolatey package: whalebird][whalebird-badge]][whalebird-choco]|[Whalebird][whalebird-web] is a Mastodon, Pleroma, and Misskey theme-able desktop client with support for multiple accounts of each, built using Electron.|

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

For daily operations, check out the AU packages
[template README][template-readme].

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

[appveyor-badge]: https://ci.appveyor.com/api/projects/status/github/FullofQuarks/chocolatey-packages?svg=true
[appveyor-page]: https://ci.appveyor.com/project/FullofQuarks/chocolatey-packages
[gist-badge]: https://img.shields.io/static/v1?label=Update%20Status&message=Gist&color=informational&logo=githubactions&style=for-the-badge
[comm-repo]: https://community.chocolatey.org/packages
[auto-pkgs]: https://chocolatey.org/docs/automatic-packages
[update-gist]: https://gist.github.com/RogueScholar/cb46f73c4b1e8e9ff5a6bc0cade5657e
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
