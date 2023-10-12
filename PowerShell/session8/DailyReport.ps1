# Configuracion de variables
$BASE_DIR=(Resolve-Path .\).Path

$LOG_FILE=$BASE_DIR + "\daily_server_status_report.log"

$head = @"
<style>
h1, h5, th {text-align: center;}
table {margin: auto; font-family: Segoe UI; box-shadow: 10px 10px 5px #888; border: thin ridge grey;}
th {background: #0046c1; color: #fff; max-width: 400px; padding: 5px 10px;}
td {font-size: 11px; padding: 5px 20px; color: #000;}
tr {background: #b8d1f3;}
tr:nth-child(even) {background: #dae5f4;}
tr:nth-child(odd) {background: #b8d1f3;}
</style>
"@
$report=$BASE_DIR + "\configuration.html"

$xml_config=$BASE_DIR + "\configuration.xml"
[xml]$xml_content=Get-Content $xml_config

Write-Output "$(Get-Date) :INFO Staring the script Execution " | Out-File $LOG_FILE -Append -Force

$db_host = $xml_content.DAILY_REPORT.DATABASE_DETAILS.HOST
$db_database = $xml_content.DAILY_REPORT.DATABASE_DETAILS.DATABASE
$db_username = $xml_content.DAILY_REPORT.DATABASE_DETAILS.USERNAME
$db_password = $xml_content.DAILY_REPORT.DATABASE_DETAILS.PASSWORD

$db_query = $xml_content.DAILY_REPORT.REPORT_QUERIES.QUERY


