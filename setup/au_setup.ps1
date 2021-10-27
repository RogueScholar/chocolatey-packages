# SPDX-FileCopyrightText: © 2020-2021 Nicholas Smith <nsmith@ethosgroup.com>
# SPDX-FileCopyrightText:  2021 Peter J. Mello <admin@petermello.net>
#
# SPDX-License-Identifier: Apache-2.0

# Only needed for Windows Management Framework < 5.0
if ($PSVersionTable.PSVersion -lt $(New-Object System.Version("5.0.0.0"))) {
  choco upgrade dotnet4.5.1 --yes
  choco upgrade powershell-packagemanagement --ignore-dependencies --yes
}

$refreshenv = Get-Command Update-SessionEnvironment -ea SilentlyContinue
if ($null -ne $refreshenv -and $refreshenv.CommandType -ne 'Application') {
  # Chocolatey profile must be installed to work properly (Choco v0.9.10.0+).
  Update-SessionEnvironment
} else {
  Write-Warning "We detected that you do not have the Chocolatey PowerShell
  profile installed, which is necessary for 'refreshenv' to work in PowerShell."
}

Install-PackageProvider -Name NuGet -Force
Set-PSRepository -Name PSGallery -InstallationPolicy Trusted
Install-Module AU -Scope AllUsers
Get-Module AU -ListAvailable | Select-Object Name, Version
