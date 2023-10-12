# HashTable o diccionario
$hash = @{
    "name" = "Student1 name";
    "Course" = "Advance PowerShell";
    "Sex" = "Male"
}

$hash

# ------------------------------
$server_data_hash = @{
    "127.0.0.1" = "Remote Machine 1";
    "127.0.0.2" = "Remote Machine 2";
    "127.0.0.3" = "Remote Machine 3";
    "127.0.0.4" = "Remote Machine 4"
}
$server_data_hash

#Diferentes métodos y propiedades
$server_data_hash | Get-Member

# Para ver el número de elementos
$server_data_hash.Count

# Obtener todas las claves
$server_data_hash.Keys

# Obtener el valor por clave
$server_data_hash.'127.0.0.2'
$server_data_hash["127.0.0.2"]

# tamaño fijo?
$server_data_hash.IsFixedSize

# Agregar un nuevo par al hashTable
$server_data_hash.Add("127.0.0.5", "Remote Machine 5")
$server_data_hash

# no se permiten duplicados
$server_data_hash.Add("127.0.0.1", "Another Remote Machine 1")

# Eliminar un par clave-valor
$server_data_hash.Remove("127.0.0.1")
$server_data_hash

# Ordenando el almacenamiento
[hashtable]$hash = [ordered]@{
                        Detail_100 = "value";
                        Detail_01 = "Square";
                        Detail_06 = "Blue"
                    }
$hash

# Usos prácticos:
$student_date = @{
    "Person1" = @{"Detail1" = "Hello"; "Detail2" = "Hii"};
    "Person2" = @{"Detail1" = "Hello"; "Detail" = "Hii"}
}
$student_date["Person1"]