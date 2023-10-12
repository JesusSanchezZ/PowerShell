# Creación de una variable
$My_Variable1 = "Some String value"
$Global:var_name = "Esto será accesible a través del script"

# Para acceder a una variable
$My_Variable1

# listado de variables
Get-Variable

# Otras formas de crear variables
Set-Variable -Name "myVar1" -Value "valor de la variable"
New-Variable -Name "myVar2" -Value "valor de la variable"

#Limpiar el contenido de una variable
$var = "Test"
Clear-Variable -Name 'var'
$var
$var.GetType()
$var = 2.3

# nombrar una variable con cualquier caracter
${ give any _name&&**++ } = "valor de esta variable"

# Creación de constantes
Set-Variable const_var -Option Constant -Value 100

Set-Variable readonly_var -Option ReadOnly -Value 100

## Tipos de datos y conversión de tipos.
$var = 10
$var = "10"
$var.GetType()

$bool_var1 = $true
$bool_var2 = $false

$bool_var1.GetType()

# Ejemplos
$var1 = 100
$var2 = 205

# Suma
$sum = $var1 + $var2
$sum

# Diferencia
$diff = $var1 - $var2
$diff

# Multiplicación
$multiply = $var2 * $var1
$multiply

# División
$divide = $var2 / $var1
$divide

# tipo de la variable
$sum.GetType()
$diff.GetType()
$multiply.GetType()
$divide.GetType()

#Ejercicio
$mark1 = 74
$mark2 = 85
$mark3 = 77

$percent = ( $mark1 + $mark2 + $mark3 ) / (100 + 100 + 100) * 100

Write-Host "El porcentaje es: $percent%"

# comilla simple y dobles
$temperature=42
Write-Output "Temperatura : $temperature"
Write-Output 'Temperatura : $temperature'

# Funciones en variables
$string_var = "a Random String"
$string_var.Length
$string_var.Contains("Random")
$string_var.Contains("random")
$string_var.IndexOf("Random")
$string_var.IndexOf("ddd")           # -1 si no está en la cadena
$string_var.Replace("Random", "Nice")

# Multiples líneas de texto en cadena
$text = @"
Question: "who are you?"
Answer: "I am so & so an came here fot this purpose"
"@

$text

$age = 25
$normal = "
I am $age years old
How old are you?
"
$normal

$normal = @'
I am $age years old
How old are you?
'@


# Conversión de tipos
# Metodo 1: una vez que hemos declarado una variable de tipo entera, no podemos sobreescribir el tipo
[int]$x = 100
$x.GetType()

# Arrojará un error
$x = "Valor de cadena"

# Conversión de tipos 
$date_string = "01/26/2018"
[DateTime]$date_string = $date_string
$date_string

$date_string.GetType()