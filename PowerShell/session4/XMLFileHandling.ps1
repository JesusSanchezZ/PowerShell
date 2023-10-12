Clear-Host

# Ejemplo 1: Lectura de un archivo xml
[xml]$xml_content = Get-Content "comp_info_sample.xml"
$xml_content

$xml_content.GetType()

$xml_content | Get-Member

# Leyendo el xml
$xml_content.MAIN_NODE

$xml_content.MAIN_NODE.ADDITIONAL_INFO

$xml_content.MAIN_NODE.FirstChild

$xml_content.GetElementsByTagName("COMP")

foreach ($entity in $xml_content.GetElementsByTagName("COMP")){
    Write-Output $entity.IP
    $owner_team = $entity.OWNED_BY_TEAM
    Write-Output $owner_team
}

# uso práctico.
# 1 Preparar un archivo de configuración y leer los valores alimentados por el script

# 2 Guardar el estado del objeto en un archivo. Este archivo puede ser cargado a porwerShell y acceder
# al mismo objeto como si fuera de un acceso en vivo. Esto puede ser usado para debugguear un problema del sisteya

Get-Process | Select-Object -First 2 | Export-Clixml output.xml

# Manejo de archivo JSON
# Cómo leer un archivo JSON
$json_object = Get-Content .\sample_json.json | Out-String | ConvertFrom-Json
$json_object

$json_object | Get-Member

$json_object.COMP_INFO

$services = $json_object.COMP_INFO.machine_name.SERVICE_INSTALLED
$services

