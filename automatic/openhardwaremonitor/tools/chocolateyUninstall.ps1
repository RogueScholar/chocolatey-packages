# SPDX-FileCopyrightText: © 2020-2021 Nicholas Smith <nsmith@ethosgroup.com>
#
# SPDX-License-Identifier: Apache-2.0

$ErrorActionPreference = 'Stop';

$StartMenuDir = (Get-ItemProperty -Path "HKLM:\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" -Name "Common Programs") | Select-Object -ExpandProperty "Common Programs"

$shortcutFile = Join-Path -Path $StartMenuDir `
                          -ChildPath "OpenHardwareMonitor.lnk"

Remove-Item -Path $ShortcutFile
