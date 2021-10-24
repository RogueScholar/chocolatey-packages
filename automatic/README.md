# Automatic Folder

<!--
  SPDX-FileCopyrightText: © 2020-2021 Nicholas Smith <nsmith@ethosgroup.com>
  SPDX-FileCopyrightText:  2021 Peter J. Mello <admin@petermello.net>

  SPDX-License-Identifier: Apache-2.0
-->

This is where you put your Chocolatey packages that are automatically packaged
by [AU][au-module].

## Automatic Updater (AU)

AU keeps packages targeting the latest upstream release without automatic
package tokens necessary. So you can treat the packages as normal.

Execute `update_all.ps1` in the repository root to run AU updater with default
options.

To fully setup all the features, make sure you perform the steps listed in
[setup/README.md][setup-readme] from the
[chocolatey-packages-template repository][cpt-repo].

To get the packages that implement AU updater run `Get-AUPackages` (or its
alias, `lsau`) in this directory.

| :information_source: **NOTE:** :information_source: |
| :------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Ensure when you are creating packages for AU, you don't use `--auto` as the packaging files should be normal packages. AU doesn't need the tokens to do replacement. |

[au-module]: https://chocolatey.org/packages/au
[cpt-repo]: https://github.com/chocolatey/chocolatey-packages-template
[setup=readme]: https://github.com/chocolatey/chocolatey-packages-template/blob/master/setup/README.md#automatic-updater-au
