# Ejemplo while loop
$i = 1
while ($i -le 10) {
    Write-Output "El valor de i: $i";
    $i +=1 # similar a $i = $i + 1
}

Write-Output "finalización"

# Ejemplo Do While loop
$i = 10
do{
    Write-Output "Count: $i"
    $i--
}while($i -ge 0)

# Ejemplo For loop
for($i = 0; $i -le 10; $i++){
    "Counter : $i"
}

# Ejemplo iteración de un arreglo
$arr = @("student1", "student2", "student3")
$arr.Count
for($i = 0; $i -lt $arr.Length; $i++){
    Write-Output $arr[$i]
}

# Foreach
foreach($name in $arr){
    echo "Hello! My name is $name"
}

#Iteración de un HashTable
$student_data = @{
    "Person1" = "Details of Person1";
    "Person2" = "Details of Person2"
}

$student_data["Person1"]
$student_data.Keys

foreach($key in $student_data.Keys){
    $message = "studen_data: $key : " + $student_data[$key]
    Write-Output $message
}