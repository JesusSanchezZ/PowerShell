# Ejemplo 1
# Seleccionando todas las propiedades por wildcard(*)
Get-Service -Name "a*" | Format-List -Property *

# Seleccionando algunas propiedades popr nombre
Get-Service -Name "a*" | Format-List -Property Name, Status, DisplayName

# Ejemplo 2: Formateando en tabla
Get-Service -Name "a*" | Format-Table -Property Name, Status

Get-Process -Name "a*" | Format-Table -Property Name, ProductVersion, Description -Wrap

# los 10 procesos que toman mas cpu
Get-Process | Sort-Object cpu -Descending | Select-Object -First 10 |
Format-Table processname, id, cpu, ws, pm

# Ejemplo 3: ConvertTo-Html
Get-Process | Sort-Object cpu -Descending | 
Select-Object -First 10 | ConvertTo-Html -Property name, CPU

Get-ChildItem -Path D:\PowerShell\ -Recurse | ConvertTo-Html -Property name, fullname | Out-File 'files_Report.html'

# aplicar CSS
Get-ChildItem -Path D:\PowerShell\ -Recurse | 
ConvertTo-Html -Property name, fullname -CssUri myStyle.css | 
Out-File 'files_Report.html'

# Añadiendo css a html sin usar archivo externo css
$head = @"
<style>
h1, h5, th { text-aign: center; }
table { margin: auto; font-family: Segoe UI; box-shadow: 10px 10px 5px #888; border: thin ridge grey; }
th { background: #0046c3; color: #fff; max-width: 400px; padding: 5px 10px; }
td { font-size: 11px; padding: 5px 20px; color: #000; }
tr { background: #b8d1f3; }
tr:nth-child(even) { background: #dae5f4; }
tr:nth-child(odd) { background: #b8d1f3; }
</style>
"@

$head
$body = "<h1>System's Process Information</h1> `n<h5>Updated: on $(Get-Date)</h5>"

Get-Process | Select-Object -Last 20 | 
ConvertTo-Html -Property ProccessName, Handles, NPM, PM, WS, CPU, Id, SI -Head $head -Title "ReportTitle" -Body $body | 
Out-File 'Process_Report.html'

# Ejemplo 8 ConvertTo-Csv
# Export-Csv es igual a ConvertTo-Csv, excepto que guarda la cadena CSV a un archivo.
Get-Service -Name AppMgmt | ConvertTo-Csv -Delimiter ","

# Ejemplo 9 ConvertTo-JSON
Get-Service -Name "*z*" | ConvertTo-Json

# Ejemplo 10 ConvertTo-XML
$aa = Get-Process -Name "*a*" | ConvertTo-Xml
$aa.FirstChild
$aa

# out-gridview
Get-Process | Out-GridView

Get-Service | Out-GridView

Get-WmiObject -Namespace 'root\cimv2' -List | Out-GridView