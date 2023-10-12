# Visualización de procesos
Get-Process | Select-Object -Last 4

# Exportamos los datos a un archivo xml
Get-Process | Select-Object -Last 4 | Export-Clixml 'process_object.xml'

# Importamos y almacenamos el archivo en una variable de powerShell
$saved_process = Import-Clixml process_object.xml

$saved_process.GetType()
