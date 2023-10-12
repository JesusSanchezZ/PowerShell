Clear-Host

# Ejemplo 1: comprobación de la ruta
if(Test-Path "D:\PowerShell\session4\Random_File.txt"){
    # Write-Output "El archivo Existe"
    Write-Verbose "El archivo existe" -Verbose
} else {
    Write-Output "El archivo no existe"
}

# Ejemplo 2:  Lectura de un archivo después de verificar que existe
# Ejemplo 1: comprobación de la ruta
if(Test-Path "D:\PowerShell\session4\Random_File.txt"){
    Get-Content "D:\PowerShell\session4\Random_File.txt"
} else {
    Write-Output "El archivo no existe"
}


# Ejemplo 3: Utilizando parametros para leer el texto requerido
# Lectura de abajo
Get-Content "D:\PowerShell\session4\Random_File.txt" -Tail 2

# Lectura de un rango de líneas
$file_content = (Get-Content "D:\PowerShell\session4\Random_File.txt")[2..5]
Write-Output "El contenido del archivo es: "$file_content

# Buscando en el contenido del archivo
$file_content | Where-Object { $_ -like "*ERROR*" }
$file_content | Where-Object { $_ -like "*WARning*" }

# Select-String
$file_content | Select-String -Pattern "Error"

"powershell", "PowerShell", "SHELL", "Shell" | Select-String -Pattern "Shell" -CaseSensitive

Select-String -Path ".\Random_File.txt" -Pattern "ERROR"
# Esto puede ser utilizado par busquedas en multiples archivos. Solo tienes que especificar wild card 
# En el nombre del archivo y buscará en todos los archivos el patrón

Select-String -Path ".\*.txt" -Pattern "ERROR"

# Creación de un mini script utilizando try catch
Clear-Host
try{
    $file_name = "D:\PowerShell\session4\Random_File.txt"

    if(Test-Path $file_name){
        Write-Output "El archivo existe"
        $last_4_lines = Get-Content -Path $file_name -Tail 4 -ErrorAction Stop -ErrorVariable "err"
        Write-Output "Estas son las últimas 4 lineas del archivo:"
        Write-Output $last_4_lines
    } else {
        Write-Output "Hola usuario. El archivo que estas intentando acceder no existe. Por favor comprueba si fué eliminado"
    }
} catch {
    Write-Output "Algo salió mal. Error: $err"
}

# Escribir texto en un archivo (Esto creará el archivo si no existe)
Write-Output "$(Get-Date) : This is a text " | Out-File -FilePath output.txt

# Para agregar texto al final de un archivo existente (Crea el archivo solo sí no existe)
Write-Output "$(Get-Date) : This is a text " | Out-File -FilePath output.txt -Append

$var = "Some random variable"
Write-Output "$(Get-Date) : var = $var " | Out-File -FilePath output.txt -Append

# ------------------------
write-output "$(Get-Date) : printing line 0 " | Out-File -FilePath output.txt
Write-Output "$(Get-Date) : printing line 1 " | Out-File -FilePath output.txt -Append
Write-Output "$(Get-Date) : printing line 2 " | Out-File -FilePath output.txt -Append
Write-Output "$(Get-Date) : printing line 3 " | Out-File -FilePath output.txt -Append
Write-Output "$(Get-Date) : printing line 4 " | Out-File -FilePath output.txt -Append
Write-Output "$(Get-Date) : printing line 5 " | Out-File -FilePath output.txt