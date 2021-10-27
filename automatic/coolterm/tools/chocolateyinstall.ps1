# SPDX-FileCopyrightText: © 2020-2021 Nicholas Smith <nsmith@ethosgroup.com>
# SPDX-FileCopyrightText:  2021 Peter J. Mello <admin@petermello.net>
#
# SPDX-License-Identifier: Apache-2.0

$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url      = 'https://freeware.the-meiers.org/CoolTermWin32Bit.zip'
$url64    = 'https://freeware.the-meiers.org/CoolTermWin.zip'

$packageArgs  = @{
  packageName    = $env:ChocolateyPackageName
  unzipLocation  = $toolsDir
  url            = $url
  url64bit       = $url64

  checksum       = '4927691fc9cd5900deb77ce64156052bc17471d58fd9b4dbaf0ea9ff100bb94815ac70c80f1381c5ba936b1fc70de8403a6161c5081c9e992b4f13a33971fec1'
  checksumType   = 'sha512'
  checksum64     = 'e71979df8749196e82dcf4ffc5279c49a4058db1f4166d60fe369649bffed15cb03388658993df4069db8b7045ffbab6c59123a067304c4e5e284657534bb76ac11a5f72f6cee829af101e8b2114bad1ebbb287ecb4c5048d1bd17c78825f7ae'
  checksumType64 = 'sha512'
}

Install-ChocolateyZipPackage @packageArgs
