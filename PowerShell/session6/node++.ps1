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