# SPDX-FileCopyrightText: © 2020-2021 Nicholas Smith <nsmith@ethosgroup.com>
#
# SPDX-License-Identifier: Apache-2.0

Import-Module au

$releases = 'https://github.com/h3poteto/whalebird-desktop/releases'

function global:au_BeforeUpdate() {
  $Latest.Checksum32 = Get-RemoteChecksum -Algorithm sha512 $Latest.URL
  $Latest.Checksum64 = Get-RemoteChecksum -Algorithm sha512 $Latest.URL64
}

function global:au_SearchReplace {
  Write-Host($Latest.Checksum32)
  @{
    "tools\chocolateyinstall.ps1" = @{
      "(^[$]url32\s*=\s*)('.*')"      = "`$1'$($Latest.URL)'"
      "(^[$]url64\s*=\s*)('.*')"      = "`$1'$($Latest.URL64)'"
      "(^[$]checksum\s*=\s*)('.*')"   = "`$1'$($Latest.Checksum32)'" 
      "(^[$]checksum64\s*=\s*)('.*')" = "`$1'$($Latest.Checksum64)'"
    }
  }
}
function global:au_GetLatest {
  $download_page   = Invoke-WebRequest -Uri $releases -UseBasicParsing
  $re              = "windows"
  $url             = $download_page.links | Where-Object href -match $re |
                       Select-Object -First 2 -expand href
  $sourceUrl       = 'https://github.com' + $url[0]
  $sourceUrl64     = 'https://github.com' + $url[1]
  $version         = ($url[0] -split '\/' | Select-Object -Index 5).Substring(0)
  
  return @{
    URL            = $sourceUrl
    URL64          = $sourceUrl64
    Version        = $version
    ChecksumType32 = 'sha512'
    ChecksumType64 = 'sha512'
  }
}

update -ChecksumFor none
