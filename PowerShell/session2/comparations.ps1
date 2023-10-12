Clear-Host

# Operador -eq
2 -eq 2
("abc" -eq "abc") -and ("abc" -ceq "ABC")

# Operador -ne
"abc" -ne "ABC"

# Operador -lt
5 -lt 10
7, 8, 9 -le 8
7, 8, 9 -lt 8

# Operator: -like <string[]> -like <wildcard-expression>
"PowerShell" -like "*shell*"
"PowerShell" -clike "*shell*"

# Operator: -notlike 
"PowerShell" -notlike "*shell"

# Otros ejemplos
@(
"This is a line about XYZ Country",
"This is a line about ABC Country",
"This is a line about SSS Country"
) -like "*sss*"
{or}
"This is a line about XYZ Country", "This is a line about ABC Country"