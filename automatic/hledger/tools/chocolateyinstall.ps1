# SPDX-FileCopyrightText: © 2020-2021 Nicholas Smith <nsmith@ethosgroup.com>
# SPDX-FileCopyrightText:  2021 Peter J. Mello <admin@petermello.net>
#
# SPDX-License-Identifier: Apache-2.0

$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url      = 'https://github.com/simonmichael/hledger/releases/download/1.23/hledger-windows.zip'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  url           = $url
  checksum      = '51d3fc0af43454f7f2c095473474d66905fc4d8d6e420a4aa0c81b58833728eb'
  checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
