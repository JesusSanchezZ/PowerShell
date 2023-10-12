# Ejemplo 1: Creación de una clase simple en PowerShell
class Student{
    [String]$name='NA'
    [int32]$age='0'
}

# Instanciación de la clase
$student_obj = New-Object Student
$student_obj

$student_obj.GetType()

$student_obj | Get-Member

$student_obj.age

$student_obj.age = 100
$student_obj.name = 'Jesus Sanchez'

# Ejemplo 2, Clase simple en PowerShell
class MathClass {
    [int32]$number1 = 0
    [int32]$number2 = 0

    # Method
    [int32] Addition(){
        return $this.number1 + $this.number2;
    }

    # Method
    [int32] Subtraction(){
        return $this.number2 - $this.number1;
    }

    # Method
    [String] toString(){
        return "Hola esta es una clase que puede ser utilizada para realizar operaciones matemáticas sobre " + $this.number1 + " y " + $this.number2;
    }
}

$mathclass_obj = New-Object MathClass
$mathclass_obj

$mathclass_obj | Get-Member

$mathclass_obj.number1 = 100
$mathclass_obj.number2 = 200
$mathclass_obj.Subtraction()

$mathclass_obj.Addition()

$mathclass_obj.toString()