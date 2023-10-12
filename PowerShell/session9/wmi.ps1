Get-WmiObject
gwmi

# Obtener la lista de namespaces
gwmi -Namespace "root" -Class "__Namespace" | select Name

# Obtiene todas las clases de los namespace
Get-WmiObject -Namespace 'root\cimv2' -List

(Get-WmiObject -Namespace 'root\cimv2' -List).count

Get-WmiObject -Namespace 'root\cimv2' -List | Out-GridView

# Obteniendo todas las propiedades por el nombre de la clase
Get-WmiObject -Class 'Win32_Service'

# WMI en maquinas remotas
Get-WmiObject -Class 'Win32_Service' -ComputerName 'localhost'

Get-WmiObject -Class 'Win32_Service' -ComputerName '172.17.6.105' | Out-GridView

Get-WmiObject -Class 'Win32_Service' -ComputerName '172.17.6.100' | Out-GridView

Get-WmiObject -Class 'Win32_Service' -ComputerName '172.18.2.120'

# Obtener controladores de disco
Get-WmiObject -Class "Win32_LogicalDisk" -ComputerName '172.17.6.105'
Get-WmiObject -Class "Win32_LogicalDisk" -ComputerName 'localhost'

Get-WmiObject -Class "Win32_ComputerSystem" -ComputerName '172.17.6.105'
Get-WmiObject -Class "Win32_ComputerSystem" -ComputerName 'localhost'

Get-WmiObject -Class "Win32_OperatingSystem" -ComputerName '172.17.6.105'
Get-WmiObject -Class "Win32_OperatingSystem" -ComputerName 'localhost'

Get-WmiObject -Class "Win32_PhysicalMemory" -ComputerName '172.17.6.105'
Get-WmiObject -Class "Win32_PhysicalMemory" -ComputerName 'localhost'

# wbemtest
<#
    Clases importantes
    Win32_OperatingSystem
    Win32_LogicalDisk
    Win32_Process
    Win32_PhysicalMemory
    Win32_ComputerSystem
#>

# memoria física
Get-WmiObject -Query "select * from Win32_PhysicalMemory" -ComputerName 'localhost'

# información del sistema
Get-WmiObject -Query "select * from Win32_ComputerSystem" -ComputerName 'localhost'