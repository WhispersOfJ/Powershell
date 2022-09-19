Import-Module Terminal-Icons
Import-Module PSReadLine

Set-PSReadLineKeyHandler -Key UpArrow -Function HistorySearchBackward
Set-PSReadLineKeyHandler -Key DownArrow -Function HistorySearchForward
Set-PSReadLineKeyHandler -Key Tab -Function Complete
Set-PSReadLineOption -PredictionSource History -PredictionViewStyle ListView
Set-PSReadLineOption -EditMode Windows

Import-Module PSWindowsUpdate

$env:Path += ";C:\Users\whisp\OneDrive\Documents\WindowsPowerShell\Scripts"
$env:Path += ";C:\Users\whisp\Things\"

$ChocolateyProfile = "$env:ChocolateyInstall\helpers\chocolateyProfile.psm1"
if (Test-Path($ChocolateyProfile)) {
  Import-Module "$ChocolateyProfile"
}
try { $null = gcm pshazz -ea stop; pshazz init 'default' } catch { }

Import-Module 'C:\tools\poshgit\dahlbyk-posh-git-9bda399\src\posh-git.psd1'

Import-Module posh-docker
Import-Module Posh-SSH
Import-Module z
Import-Module PSFzf

Set-PsFzfOption -PSReadlineChordProvider "ctrl+f"
Set-PsFzfOption -PSReadlineChordReverseHistory "ctrl+r"

Set-Alias winfetch pwshfetch-test-1

winfetch
. C:\Users\whisp\Things\quote.ps1

Set-Location C:\Users\whisp