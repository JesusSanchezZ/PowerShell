Clear-Host

function say-hello{
    Write-Output "Hello how are you doing"
    Write-Output "I hope you are doing well"
    Write-Output "Do you have any Questions?"
}

say-hello

# Ejemplo 1
function Add-Numbers {
    $total = $args[0] + $args[1]

    Write-Output "Total: $total"
}

Add-Numbers 10 2

# Ejemplo 2: Pasando arreglos como argumentos
function say-hello($names){
    foreach($name in $names){
        echo "Hii All! This is $name"
    }
}

$names = @("Uno", "Dos", "Tres")
say-hello $names

# Ejemplo de función con nombres de parámetros
function My-Introduction
{
    param
    (
        [string]$Name,
        [string]$profession = "Student", # parámetros opcionales
        [int]$age
    )

    Write-Output "Hello There!! My name is $Name an i am $age years old $profession"
}

My-Introduction -Name "Vijay" -age 39