# SPDX-FileCopyrightText: © 2020-2021 Nicholas Smith <nsmith@ethosgroup.com>
# SPDX-FileCopyrightText:  2021 Peter J. Mello <admin@petermello.net>
#
# SPDX-License-Identifier: Apache-2.0

$ErrorActionPreference = 'Stop';
$toolsDir    = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$packageName = 'whalebird'

$url32       = 'https://github.com/h3poteto/whalebird-desktop/releases/download/4.4.5/Whalebird-4.4.5-windows-ia32.exe'
$url64       = 'https://github.com/h3poteto/whalebird-desktop/releases/download/4.4.5/Whalebird-4.4.5-windows-x64.exe'
$checksum    = 'dcc6483afbfa6ac6aaeb3e5e9bfc193d0b821b0c1367aa731285848d2f9a55656fefb66432b46c94ea32d01f872607ef70fb227da10eefc0f96d5aeb95558fca'
$checksum64  = '7e7a611bf39757c972e30255b646adb4da15602fd01cb1435767ad2f0920678788158a5493f2212a1edfa7bd042b3a9e202e76cf952656ab45474246c67f9035'

$packageArgs = @{
  packageName    = $packageName
  unzipLocation  = $toolsDir
  fileType       = 'EXE'
  url            = $url32
  url64bit       = $url64

  softwareName   = 'whalebird*'
  checksum       = $checksum
  checksumType32 = 'sha512'
  checksum64     = $checksum64
  checksumType64 = 'sha512'

  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
