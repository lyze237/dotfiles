{{ if eq .chezmoi.os "windows" -}}
 "Install-Module -Scope CurrentUser -Force PSReadLine"
powershell.exe -Command "Install-Module -Scope CurrentUser -Force Get-ChildItemColor" -AllowClobber
{{ end -}}