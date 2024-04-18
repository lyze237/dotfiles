{{ if eq .chezmoi.os "windows" -}}
powershell.exe -Command "Start-Process -FilePath PowerShell.exe -Verb Runas -ArgumentList \"Set-ExecutionPolicy Bypass\""
{{ end -}}