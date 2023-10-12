Clear-Host

Read-Host

# Espera las lecturas del usuario
$name = Read-Host "¿Cúal es tu nombre?"
$age = Read-Host "¿Cuántos años tienes?"
$date = Read-Host "¿Cúal es tu fecha de nacimiento?"
$password = Read-Host "Ingresa tu password: "

echo "**********Datos recibidos ******************"
echo "Tu nombre es: $name"
echo "Tu edad es: $age"
echo "Fecha de nacimiento: $date"
echo "Tu passsword es: $password"

# método 2 Lectura y validación de las entradas del usuario
[string]$name = Read-Host "¿Cúal es tu nombre?"
[int]$age = Read-Host "¿Cuántos años tienes?"
[Datetime]$date = Read-Host "¿Cúal es tu fecha de nacimiento?"
$password = Read-Host "Ingresa tu password: " -AsSecureString

echo $date.DayOfWeek
$date.Month
$date.Day

# Validaciones
[validateset("y", "Y", "n", "N")]$rsponse = Read-Host "opcion (s/n)"

[ValidateLength(5,120)]$nameW = [string](Read-Host "Your name")

[validaterange(5,120)]$age = Read-host "Your Age? (5-120)"

# Escritura en el host
Write-Host "hola tú"
Write-Host "Colorful text" -ForegroundColor Cyan
Write-Host "More colors" -ForegroundColor Green -BackgroundColor Red

Write-Output "Este es un mensaje de salida"

Write-Error "Este es un mensaje de error"
Write-Warning "Este es un mensaje de precaución"

Write-Debug "Este es un mensaje de depuración" -Debug
Write-Verbose "Este es un VERBOSE" -Verbose

# Write-Host vs otros
Write-Output "Hola" | Get-Member