Clear-Host

Get-Content "D:\PowerShell\session4\output.csv"

# Ejemplo 1: Lectura de archivo CSV
$CSV_Content = Import-Csv "D:\PowerShell\session4\output.csv"
$CSV_Content

$CSV_Content | Get-Member

$CSV_Content | Sort-Object Marks

$CSV_Content | Select-Object -First 2

$CSV_Content | Where-Object { $_.StudentName -like "R*" }

$CSV_Content.GetType()

# Ejemplo 2: Creación de archivo CSV y añadir contenido
# Los siguientes comandos crean el archivo si no existe de lo contrario añade el contenido
# al archivo existente
Add-Content -Path Students_data.csv -Value '"Name","Class","Percentage"'

# Arreglo
$student_data = @(
    '"Student 0", "Science","95%"'
    '"Student 1", "Maths","98%"'
    '"Student 2", "Geography","60%"'
)

# Añadiendo contenido al csv
$student_data | foreach { Add-Content -Path Students_data.csv -Value $_ }

$CSV_Content = Import-Csv -Path Students_data.csv
$CSV_Content

# Uso práctico.
# Convertir archivo con datos no ordenados en un archivo con datos ordenados
Import-Csv output.csv | Sort-Object Marks | Export-Csv sorted.csv -NoTypeInformation

$CSV_Content = Import-Csv sorted.csv
$CSV_Content