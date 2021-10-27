# SPDX-FileCopyrightText: © 2020-2021 Nicholas Smith <nsmith@ethosgroup.com>
# SPDX-FileCopyrightText:  2021 Peter J. Mello <admin@petermello.net>
#
# SPDX-License-Identifier: Apache-2.0
#
# Prints application version provided by MSI package file
# Usage: Get-Msi-Version.ps1 <Path to MSI file>

param (
  [Parameter(Mandatory = $true)]
  [ValidateScript( {
      if (-Not (Test-Path -Path $_)) {
        throw "File '{0}' does not exist" -f $MSI.FullName
      }
      elseif (-Not (Test-Path -Path $_ -PathType Leaf)) {
        throw "'{0}' should be a file." -f $MSI.FullName
      }
      return $true
  } )]
  [System.IO.FileInfo] $MSI
)

$MSI = (Resolve-Path -Path $MSI).Path;

# See <https://stackoverflow.com/q/8743122/383673> for theory of operation
try {
  $windowsInstaller = New-Object -com WindowsInstaller.Installer
  $database         = $windowsInstaller.GetType().InvokeMember(
    "OpenDatabase", "InvokeMethod", $Null, $windowsInstaller,
    @($MSI.FullName, 0)
  )

  $q    = "SELECT Value FROM Property WHERE Property = 'ProductVersion'"
  $View = $database.GetType().InvokeMember(
    "OpenView", "InvokeMethod", $Null, $database, ($q)
  )
  $View.GetType().InvokeMember(
    "Execute", "InvokeMethod", $Null, $View, $Null
  )

  $record  = $View.GetType().InvokeMember(
    "Fetch", "InvokeMethod", $Null, $View, $Null
  )
  $version = $record.GetType().InvokeMember(
    "StringData", "GetProperty", $Null, $record, 1
  )

  return $version
} catch {
  throw "Failed to get MSI file version: {0}." -f $_
}
