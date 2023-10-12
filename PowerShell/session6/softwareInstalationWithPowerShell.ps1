# Obtenemos el software instalado en el sistema
#Clear-Host
#$32bit_softwares = Get-ItemProperty HKLM:\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Uninstall\*
<#
$32bit_softwares = Get-ItemProperty HKLM:\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Uninstall\* |
                    Select-Object DisplayName, DisplayVersion, Publisher, InstallDate

$64bit_softwares = Get-ItemProperty HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\* |
                    Select-Object DisplayName, DisplayVersion, Publisher, InstallDate

Get-ItemProperty HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\* | Select-Object -First 4

$all_softwares = $32bit_softwares + $64bit_softwares

$32bit_softwares | Out-GridView
$64bit_softwares | Out-GridView
$all_softwares | Out-GridView

$all_softwares.DisplayName -like '*sql*'
#>

# locación del archivo fuente
$source = 'https://www.win-rar.com/fileadmin/winrar-version/winrar/winrar-x64-611.exe'

# Destino a cargar el archivo
$destination_dir = 'c:\automation\installers\'
$installation_file = "$destination_dir\winrar.exe"
$sofwareName = 'winrar'

if((Get-ItemProperty HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\*).DisplayName -eq "$softwareName*"){
    Write-Output "El software ya está instalado"
    Write-Host "-----------> Exiting <-------------" -ForegroundColor Red -BackgroundColor Yellow
} else {
    Write-Output "El software no está instalado. Procediendo con la instalación"
}

# Descarga del archivo a la dirección especifica
if(-not (Test-Path $installation_file)){
    New-Item $destination_dir -ItemType Directory -Force                 # Creación de la carpeta
    Invoke-WebRequest -Uri $source -OutFile $installation_file -Verbose  # Descargando el archivo
}

# Instalación cel software
Write-Output "Instalando el software: $softwareName"
Start-Process $installation_file /S -NoNewWindow -Wait -PassThru


# Verificación de la instalación del software
if((Get-ItemProperty HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\*).DisplayName -like "$softwareName*"){
    Write-Output "El software se instaló satisfactoriamente."
}

# Iniciando el log del proceso
Start-Transcript -Path "c:\automation\logs\winrar_install.log" -NoClobber  # -Force para forzar la escritura del archivo si ya existe.

# comandos a ejecutar

Stop-Transcript



# Ejecutar un script desde un servidor
Invoke-Command -FilePath c:\scripts\test.ps1 -ComputerName server01
<#
    El parámetro -FilePath especifica un script que está localizado en la computadora local.
    El script se ejecuta en la computadora remota y el resultado es retornado a la computadora local.
#>

# Ejecutar un comando en un servidor remoto.
# Este ejemplo ejecuta el comando Get-Culture en la computadora remota.
Invoke-Command -ComputerName server01 -Credential Domain01\User01 -ScriptBlock { Get-Culture }

<#
    el parámetro Computername especifica el nombre de la computadora remota. El parámetro Credential es utilizado para ejecutar
    el comando remoto en el contexto de seguridad de Domain\User01, un usuario que tiene permisos para ejecutar comandos. El parámetro
    ScriptBlock especifica el comando a ejecutarse en la computadora remota.

    En respuesta powerShell solicita el password y un método de autenticación para el usuario User01, y después ejecuta el comando
    en la computadora server01 y retorna los resutados.
#>