# SPDX-FileCopyrightText: © 2020-2021 Nicholas Smith <nsmith@ethosgroup.com>
# SPDX-FileCopyrightText:  2021 Peter J. Mello <admin@petermello.net>
#
# SPDX-License-Identifier: Apache-2.0

Import-Module au

$releases = 'https://github.com/FullofQuarks/Windows-Ledger-Binaries/releases'

function global:au_BeforeUpdate {
    $Latest.Checksum32 = Get-RemoteChecksum -Algorithm sha512 $Latest.URL
}
function global:au_SearchReplace {
    @{
        "tools\chocolateyinstall.ps1" = @{
            "(^[$]url\s*=\s*)('.*')"      = "`$1'$($Latest.URL)'"
            "(checksum\s*=\s*)('.*')" = "`$1'$($Latest.Checksum32)'"
        }
    }
}
function global:au_GetLatest {
  $download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing

  $re        = 'ledger.exe'
  $url       = $download_page.links | Where-Object href -match $re |
                   Select-Object -First 1 -expand href
  $sourceUrl = 'https://github.com' + $url
  $version   = ($url -split '\/' | Select-Object -Index 5).Substring(1)

  return @{
    URL            = $sourceUrl
    Version        = $version
    ChecksumType32 = 'sha512'
  }
}

update -ChecksumFor none
