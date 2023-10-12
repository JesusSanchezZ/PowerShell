Clear-Host

# Ejemplo 1
if (10 -eq 10){
    "True"
} else {
    "False"
}

# Ejemplo 2
[int]$num1 = Read-Host "Introduce un número"
[int]$num2 = Read-Host "Introduce otro número"
if ($num1 -eq $num2){
    "Introdujiste $num1"
} else {
    "Introdujiste $num1 y $num2. No son iguales."
}

# Ejemplo 3. -NOT
[int]$num = Read-Host "Introduce un número"
# -not es utilizado para revertir la logica del if
if ( -not($num -le 100)) {
    Write-Output "Introdujiste el número $num que es menor a 100"
}

# Ejemplo 4
# Bucle If Else anidados
[int]$num = Read-Host "Enter a number"
if($num -gt 100){
    if($num -lt 1000){
        Write-Output "Entered number $num is somewhere between 100 and 1000"
    }
} else {
    Write-Output "Entered number is not in the valid range"
}

# Ejemplo 5
# If else con multiples sentencias condicionales -AND
[int]$num = Read-Host "Enter a number"
if(($num -gt 100) -and ($num -lt 1000)){
    Write-Output "Entered number $num is somewhere between 100 and 1000"    
} else {
    Write-Output "Entered number is not in the valid range"
}

# Ejemplo 6
# If else con multiples sentencias condicionales -OR
[int]$num = Read-Host "Enter a number"
if(($num -gt 100) -or ($num -lt 1000)){
    Write-Output "Entered number $num is somewhere between 100 and 1000"    
} else {
    Write-Output "Entered number is not in the valid range"
}

# Ejemplo 7
[int]$num = Read-Host "Enter a number"
if($num -eq 10){
    "You entered $num is equal to 10"
} elseif($num -eq 100){
    "You entered $num is equal to 100"
} elseif($num -eq 1000){
    "You entered $num is equal to 1000"
} else {
    "You entered $num is not 10, 100 or 1000"
}

# Ejemplo con switch
[int]$num = Read-Host "Enter a number"

switch($num){
    10 {"You entered $num is equal to 10"}
    100 {"You entered $num is equal to 100"}
    1000 {"You entered $num is equal to 1000"}
    default {"You entered $num is not in 10, 100 or 1000"}
}

# Asignación de variables con instrucciones if
$value = if($true){1} else {2}
$value

$day = "Sunday"
$activity = if($day -like "Sunday") {"FUN"} else {"WORK"}
$activity