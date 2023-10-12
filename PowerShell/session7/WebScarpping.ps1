# Version 1
# web scrapping basics
$webrequest = Invoke-WebRequest -Uri "https://corporativomca.udemy.com/"

# Obteniendo el código de estado
# 200 significa que no hubo un error en la petición http
$status_code = $webrequest.StatusCode
$status_desc = $webrequest.StatusDescription

# Obtiene todos los enlaces en la página web
$webrequest.Links
$webrequest.Links | select href

$webrequest.Links | select href | Out-File urls_found.txt

# Leyendo el contenido
$webrequest.RawContent




