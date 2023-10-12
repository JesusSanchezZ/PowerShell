# Comentario de una sola línea. Será ignorado por powerShell

<#
    Comentarion multilínea. Cualquier cosa que pongas dentro de este bloque
    será ignorado por powerShell
#>

echo "Hola Imprimeme" # Este es el comando imrpimir

# Ejemplo, obtener la dirección del directorio de trabajo actual.
Get-Location

# Ejemplo 2, cambio del directorio
Set-Location Test_folder1
Get-Location

Set-Location D:\PowerShell\session1\practice
Get-Location

# Set-Location ..
# Get-Location

# Regresar
Set-Location ..
Get-Location

# Ejemplo 3. Fecha actual
Get-Date

# Ejemplo 4. Listar todos los archivos y folders en el directorio actual
Get-ChildItem

# Busqueda recursiva dentro de los subfolder
Get-ChildItem -Recurse

# Obtener la lista de elementos por ruta
Get-ChildItem -Path .\session1

# Ejemplo 5. Imprimir en consola
Write-Output "Impreso en consola" #Write-Host "Hola mundo"

# Ejemplo 6. Limpiar pantalla
Clear-Host

# Copiar un archivo.
Copy-Item -Path .\ejemplo1.ps1 -Destination Test_folder1\

# Copia todo de la ruta fuente a la ruta destino. La ruta destino debe de existir.
Copy-Item -Path Test_folder1\* -Destination Test_folder2\ -Recurse

# Copia todo de la ruta fuente a la ruta destino
# (Excepto los archivos dentro de los subfolders)
Copy-Item -Path Test_folder1\* -Destination Test_folder2\

# Ejemplo 7. Mueve un elemento de la fuente al destino
Move-Item -Path .\Test_folder1\ejemplo1.ps1 -Destination Test_folder2\
Copy-Item -Path .\Test_folder2\ejemplo1.ps1 -Destination Test_folder1

# Mueve y renombra
Move-Item -Path .\Test_folder1\ejemplo1.ps1 -Destination Test_folder2\new-name.txt

# Ejemplo 8. Renombrar un archivo o carpeta
Rename-Item -Path .\Test_folder1\ejemplo1.ps1 -NewName ThisIsTheNewName.txt
# o
Rename-Item -Path .\Test_folder1\ejemplo1.ps1 -NewName "This Is The New Name.txt"
# Carpeta
Rename-Item -Path .\Test_folder2 -NewName New_name

# Ejemplo 9. Eliminar un elemento.
Remove-Item -Path '.\Test_folder1\This Is The New Name.txt'

# Eliminar un folder
Remove-Item -Path .\Test_folder2 -Recurse

# Ejemplo 10. Cómo obtener ayuda de powerShell
Get-Help Remove-Item

# Ejemplo 11. Obtener la lista de comandos ejecutados en el shell
Get-History

# Ejemplo 12. Limpiar el historial del shell
Clear-History



