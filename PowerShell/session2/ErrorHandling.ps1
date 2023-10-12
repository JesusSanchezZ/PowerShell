<#
    TASK                        Uncertainties
Reading/Writting File content   File got deleted, Network dependency, File locked, insufficient Access
Database Operation              Database table not existing, DB manitenance in progress, Database down, Network dependency, insufficient Access, Data Duplication not allowed
Sending Daily Report            SMTP Sever Issue, Report File locked
Version                         Script was developed for a particular version wich wasn't available in actual production environment
#>

# Ejemplo
$UpdateList_GenuineEmploys = Get-Content \\FileServer\HRDepartment\CompanyEmployees.txt -ErrorAction Stop
#$CurrentEmployees = Get-MyEmploys # algún cmdlete(solamente de ejemplo) que retorna la lista de empleados

# Asumimos
$CurrentEmployees = @("Emp1", "Emp2", "Emp1000")

foreach($emp in $CurrentEmployees){
    if($UpdateList_GenuineEmploys -cnotcontains $emp){
        echo "Deleted"
        #Delete-Employee $emp  # Pasando empleado como argumento de la base de datos
    } else {
        echo "Genuine"
        #Update-Employee $emp "Genuine"  # pasando empleado como argumento para actualizar a "Genuine" in la base de datos
    }
}

# Ejemplo: Multiples bloques catch y finally
$file_name = "ImportantData.txt"

try{
    if(Test-Path $file_name) {
        Write-Output "Reading File"
        Get-Content $file_name -ErrorAction Stop -ErrorVariable 'err'
    } else {
        throw "File not available at the shared location"
    }    
} catch [System.IO.FileNotFoundException]
{
    Write-Output "File not available at $path"
}catch [System.IO.IOException]{
    Write-Output "Input/Output error with the file: $path"
}catch{
    $erroMessage = $_.Exception.Message
    $FailedItem = $_.Exception.ItemName

    Write-Host "Sorry, The file ($file_name) your are looking for help do not exists" -ForegroundColor Yellow
    Write-Host "FailedItem : $FailedItem " -ForegroundColor Red
    Write-Host "Err : $err" -ForegroundColor Yellow
} finally {
    Write-Host "An attempt to access the file($file_name) was made at $(Get-Date)"
}