#configurando variables
$BASE_DIR=(Resolve-Path .\).Path

$LOG_FILE=$BASE_DIR + "\dailyDiskSpaceMonitor.log"

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

$report=$BASE_DIR + "\dailyDiskSpaceStatus.html"

$xml_config=$BASE_DIR + "\config.xml"
[xml]$xml_content=Get-Content $xml_config

Write-Output "$(Get-Date) :INFO Staring the script Execution " | Out-File $LOG_FILE -Append -Force

$diskspace_error_threshold = [int32] $xml_content.DAILY_REPORT.MONITOR_THRESHOLD.DISKSPACE_ERROR

$diskspace_warning_threshold = [int32] $xml_content.DAILY_REPORT.MONITOR_THRESHOLD.DISKSPACE_WARNING

#=============================== Preparando el reporte ===============================================

try{
    foreach ($entity in $xml_content.DAILY_REPORT.MONITOR_SERVERS){
        $server = $entity.SERVER

        $body="<h1>Daily Summary</h1>`n<h3>Updated: on $(Get-Date)</h3>"

        Get-WmiObject -Query "select * from Win32_LogicalDisk where drivetype=3" -ComputerName $server | 
            Select-Object SystemName, DeviceId, @{Name="Size";Expression={[math]::Round($_.Size/1GB,2)}} `
                                             , @{Name="FreeSpace";Expression={[math]::Round($_.FreeSpace/1GB,2)}} `
                                             , @{Name="Occupied"; Expression={[math]::Round(100 - ($_.FreeSpace / [double]$_.Size) * 100)}} | 
            Export-Csv disk_space.csv -NoTypeInformation        
    }

    $csv_content = Import-Csv 'disk_space.csv'

    $body="<h1>Servers in Error_Status</h1>`n<h3>Updated: on $(Get-Date)</h3>"
    $csv_content | Where-Object {$_.Occupied -ge $diskspace_error_threshold} | ConvertTo-Html -Property SystemName, DeviceId, FreeSpace, Occupied `
        -Head $head -Body $body | Out-File $report

    $body="<h1>Servers in Warning_Status</h1>`n<h3>Updated: on $(get-date)</h3>"
    $csv_content | Where-Object {$_.Occupied -lt $diskspace_error_threshold -and $_.Occupied -gt $diskspace_warning_threshold} |
        ConvertTo-Html -Property SystemName, DeviceId, Size, FreeSpace, Occupied `
        -Body $body | Out-File $report -Append

    $body="<h1>Servers in Good Status</h1>`n<h3>Updated: on $(Get-Date)</h3>"
    $csv_content | Where-Object {$_.Occupied -lt $diskspace_warning_threshold} | ConvertTo-Html -Property SystemName, DeviceId, Size, FreeSpace, Occupied `
        -Body $body | Out-File $report -Append
} catch{
    $ErrorMessage = $_.Exception.Message
    Write-Output "$(Get-Date) :ERROR something went wrong ErrorMessage : $ErrorMessage " | Out-File $LOG_FILE -Append -Force
}

Write-Output "$(Get-Date) :INFO Report Preparation Execution Over" | Out-File $LOG_FILE -Append -Force


#=====================================================================================================================

#eventvwr