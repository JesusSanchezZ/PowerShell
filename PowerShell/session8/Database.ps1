$connectionString = "Data Source=XE; User Id=SYSTEM; Integrated Security=no"

[System.Reflection.Assembly]::LoadWithPartialName("System.Data.OracleClient")

$connection = New-Object System.Data.SqlClient($connectionString)

$connection.open()

$connection


$queryString = "select * from DOMAIN_SYSTEM_INFORMATION"

$command = New-Object System.Data.SqlClient.SqlCommand($queryString, $connection)

<#
Otro método para preparar el comando
$command=$connection.CreateCommmand()
$command.CommandText=$queryString
#>

$reader=$command.ExecuteReader()

Write-Verbose "Printing the table data" -Verbose
while ($reader.Read())
{
    [String]$reader.GetInt32(0) + ',' + $reader.GetString(2) + ', ' + $reader.GetString(4)
}

$connection.Close()

#===========================================================================================================
# Caso 2: En base de datos sql Server
$SQLServer="172.18.2.120"
$DBName="DB_COMPRAS"
$user_name="AdmWorK"
$db_password="P@ssw0rd`$2018#mcA"

$connectionString="Data Source=$SQLServer;Initial Catalog=$DBName;User id=$user_name;Password=$db_password;"
$connection = New-Object -TypeName System.Data.SqlClient.SqlConnection($connectionString)
$query = "Select top 10 * from cat_producto"
$command = New-Object -TypeName System.Data.SqlClient.SqlCommand($query, $connection)
$connection.Open()

$Reader = $command.ExecuteReader()

$connection.Close()



#=======INSERT STATEMENT=====================================================================================
#SQL Example:  Insert into DOMAIN_SYSTEM_INFORMATION( ROW_ID,IP_ADDRESS,SERVER_NAME,OS_VERSION,STATUS) values (1,'123.123.123.123','SEVER_NAME1','Windows Server 2008','Good');

$connectionString= "Data Source=XE;User Id=SYSTEM;Password=SYSTEM;   Integrated Security=no"
[System.Reflection.Assembly]::LoadWithPartialName("System.Data.OracleClient")

$connection = New-Object  System.Data.OracleClient.OracleConnection($connectionString)
$connection.Open()
     
$queryString = "Insert into DOMAIN_SYSTEM_INFORMATION( ROW_ID,IP_ADDRESS,SERVER_NAME,OS_VERSION,STATUS)  VALUES (:row_id, :ip_address, :server_name, :os_version, :status)"
$command = New-Object System.Data.OracleClient.OracleCommand -ArgumentList $queryString, $connection  

      

$command.Parameters.Add("row_id", 100)
$command.Parameters.Add("ip_address", "123.123.100.100")
$command.Parameters.Add("server_name","Server100")
$command.Parameters.Add("os_version","Windows Server 2016")
$command.Parameters.Add("status","Server is in awesome status")

$command.ExecuteNonQuery()

#=======INSERT STATEMENT END=====================================================================================

#=======UPDATE STATEMENT=====================================================================================
#SQL Example :   Update DOMAIN_SYSTEM_INFORMATION set OS_VERSION="Windows Server 2016" where ROW_ID = 1

$connectionString= "Data Source=XE;User Id=SYSTEM;Password=SYSTEM;   Integrated Security=no"
[System.Reflection.Assembly]::LoadWithPartialName("System.Data.OracleClient")

$connection = New-Object  System.Data.OracleClient.OracleConnection($connectionString)
$connection.Open()

#Update Values
$os_version_updated="Windows Server 2016"
$os_version_previous="Windows Server 2008"

#Framing Queries
$queryString = "Update DOMAIN_SYSTEM_INFORMATION SET OS_VERSION='$os_version_updated' where OS_VERSION='$os_version_previous'"
$command = New-Object System.Data.OracleClient.OracleCommand -ArgumentList $queryString, $connection  

$command.ExecuteNonQuery()

#=======UPDATE STATEMENT END=====================================================================================

#=======DELETE STATEMENT=====================================================================================
#SQL Example : Delete from DOMAIN_SYSTEM_INFORMATION where OS_VERSION='Windows Server 2012'

$connectionString= "Data Source=XE;User Id=SYSTEM;Password=SYSTEM;   Integrated Security=no"
[System.Reflection.Assembly]::LoadWithPartialName("System.Data.OracleClient")

$connection = New-Object  System.Data.OracleClient.OracleConnection($connectionString)
$connection.Open()

#Update Values
$os_version="Windows Server 201000"

#Framing Queries
$queryString = "Delete from DOMAIN_SYSTEM_INFORMATION where OS_VERSION='$os_version'"
$command = New-Object System.Data.OracleClient.OracleCommand -ArgumentList $queryString, $connection  

$command.ExecuteNonQuery()
#=======Delete STATEMENT END=====================================================================================

