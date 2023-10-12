# Ejemplo 1: Select-Object
Get-Service | Select-Object -First 5

Get-Service | Select-Object -Last 5

Get-Process | Select-Object -Property BasePriority, CPU, Name | Select-Object -First 5

Get-Process | Select-Object -Property *

Get-Process -Name "*a*" | Select-Object -First 2

# Ejemplo 2: where-object
Get-Process | Where-Object { $_.CPU -gt 100 }

# multiples líneas
Get-Service | Where-Object { $_.Name -like "*a*" } | Where-Object { $_.Status -eq 'Stopped' } |
 Select-Object -First 3

 # Ejemplo 3: group-object
 Get-Service | Group-Object -Property ServiceType

 # Ejemplo 4: sort-object
 Get-Process | Sort-Object BasePriority | Group-Object -Property BasePriority

 Get-Process | Sort-Object BasePriority | Group-Object -Property BasePriority | Select-Object -Last 1

 Get-Process | Sort-Object BasePriority | Group-Object -Property BasePriority | Select-Object -Last 1 -ExpandProperty group

 # Encontrar los 10 procesos que consumen más cpu
 Get-Process | Sort-Object cpu -Descending | Select-Object -First 10

 # Encuentra los 10 procesos que consumen más ram
 Get-Process | Sort-Object pm -Descending | Select-Object -First 10

 # Ejemplo 5: ForEach-Object
 # Realizar una operación contra cada elemento en una colección de objetos de entrada
 Get-Process | ForEach-Object {
    Write-Host "Processining : Doing Something on " $_.Name
 }

 1..10 | ForEach-Object {
    echo "hello world : $($_)"
 }

 Get-ChildItem -Path D:\PowerShell\session4 -Recurse | ForEach-Object {
    echo $_.FullName
 }

 # Solución a problema practico
 # Eliminar todos los archivos mayores a 10 días de un directorio
 # No elimina los subfolders.

 $purge_dir = "D:\PowerShell\session1"
 $retention_days = 1
 Get-ChildItem -File -Recurse $purge_dir | 
    Where-Object { $_.LastWriteTime -lt (Get-Date).AddDays(-$retention_days) } | % {
        # Eliminando el archivo
        $_.FullName | del -Force -WhatIf
    }

# -WhatIf notifica de la accion a ejecutar.
