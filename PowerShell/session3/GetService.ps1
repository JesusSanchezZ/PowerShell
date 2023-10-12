Clear-Host

Get-Service

Get-Service | Sort-Object status

Get-Service -Name "*ser*" | Sort-Object name

Get-Service -Name "a*" | Where-Object { $_.Status -eq "running" }

Get-Service -Name "a*" | Where-Object { $_.Status -eq "running" } | Select-Object -First 3

# detenido e inicialización de un servicio
Get-Service -Name "*mongo*" | Stop-Service -WhatIf

Get-Service -Name MongoDB | Start-Service

