# SPDX-FileCopyrightText: © 2020-2021 Nicholas Smith <nsmith@ethosgroup.com>
# SPDX-FileCopyrightText:  2021 Peter J. Mello <admin@petermello.net>
#
# SPDX-License-Identifier: Apache-2.0

Import-Module AU

$releases = 'https://github.com/cutls/TheDesk/releases'

function global:au_BeforeUpdate {
  $Latest.Checksum32 = Get-RemoteChecksum -Algorithm sha512 $Latest.URL
  $Latest.Checksum64 = Get-RemoteChecksum -Algorithm sha512 $Latest.URL64
}

function global:au_SearchReplace {
  @{
    "tools\chocolateyinstall.ps1"  = @{
      "(^[$]url\s*=\s*)('.*')"        = "`$1'$($Latest.URL)'"
      "(^[$]url64\s*=\s*)('.*')"      = "`$1'$($Latest.URL64)'"
      "(^[$]checksum\s*=\s*)('.*')"   = "`$1'$($Latest.Checksum32)'"
      "(^[$]checksum64\s*=\s*)('.*')" = "`$1'$($Latest.Checksum64)'"
    }
  }
}

function global:au_GetLatest {
  $download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing

  $re          = 'TheDesk-ia32.exe'
  $re64        = 'TheDesk.exe'
  $url         = $download_page.links | Where-Object href -match $re |
                     Select-Object -First 1 -expand href
  $url64       = $download_page.links | Where-Object href -match $re64 |
                     Select-Object -First 1 -expand href
  $sourceUrl   = 'https://github.com' + $url
  $sourceUrl64 = 'https://github.com' + $url64
  $version     = ($url -split '\/' | Select-Object -Index 5).Substring(1)

  return @{
    URL            = $sourceUrl
    URL64          = $sourceUrl64
    Version        = $version
    ChecksumType32 = 'sha512'
    ChecksumType64 = 'sha512'
  }
}

update -ChecksumFor none
