Clear-Host

(Get-Process).GetType()

Get-Process | Sort-Object id | Select-Object -First 10

Get-Process | Sort-Object cpu -Descending | Select-Object -First 10

Get-Process -Name "*PowerShell*"

Get-Process -Name "*PowerShell*" | select *

Get-Process | Where-Object { $_.CPU -gt 100 }

Get-Process | Where-Object { $_.CPU -gt 100 } | Out-File myTop_process.txt

# Detener un proceso
Get-Process -Name "*PowerShell*" | Stop-Process -WhatIf            # no usar en produccion
