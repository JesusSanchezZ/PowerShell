#eventvwr

Get-EventLog

# lista los diferentes tipos de log disponibles
Get-EventLog -List

# Obtiene los logs
Get-EventLog -LogName Application

(Get-EventLog -LogName Application).count

Get-Help Get-EventLog -Online

Get-EventLog -Newest 5 -LogName Application

# Almacenar los logs en un arreglo de powershell
$Events = Get-EventLog -LogName Application -Newest 10

# uso del arreglo a nuestras necesidades
$Events | Group-Object -Property source -NoElement | Sort-Object -Property count -Descending

# obtener solamente los mensajes por tipo de error 
Get-EventLog -LogName System -EntryType Error -Newest 10

# Leyendo eventos específicos por filtro
Get-EventLog -LogName Application -Source "Schannel" | where {$_.EventID -eq 36882}


# Obtener todos los mensajes entre un rango de tiempo seleccionado
$endTime = Get-Date 
$startTime = $endTime.AddHours(-1) # última hora
<#
$startTime = $endTime.AddDays(-1) # último día
$startTime = $endTime.AddMinutes(-1) # último minuto
#>

Get-EventLog -LogName Application -EntryType Information -After $startTime -Before $endTime

# Guardar la salida a Html/css y enviarlo por correo
Get-EventLog -LogName Application -EntryType Information -After $startTime -Before $endTime | 
    ConvertTo-Html Index, Source, Time, Message >> out.html

# Leer eventos de una computadora remota
Get-EventLog -Newest 2 -LogName 'Windows PowerShell' -ComputerName "172.17.6.105"

# Prueba 
Get-EventLog -Newest 2 -LogName 'Windows PowerShell' -ComputerName "localhost", "localhost"

# leyendo los eventos con WMI
Get-WmiObject -Class Win32_NTLogEvent | Select-Object -First 5

$Log_message = Get-WmiObject -Class Win32_NTLogEvent -Filter "(logfile='Application') and (type='error')" |
    Select-Object -First 4

$Log_message | Format-Table EventCode, EventType, Message -AutoSize


# Registrar una fuente de eventos y escribir
New-EventLog -LogName 'Application' -Source "My Script"

# Crear un nuevo evento
New-EventLog -LogName "MyApp_Log" -Source "MyApp" -MessageResourceFile "C:\myapp_log.dll"

Write-EventLog -LogName Application -Source "My Script" -EntryType Error -EventId 1 -Message "this is a test message"



