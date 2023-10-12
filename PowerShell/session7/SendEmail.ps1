# Detalles del usuario  y del servidor smtp.
$SMTPServer = "smpt.gmail.com"
$SMTPPort = "587"
$Username = "testingpurpose201801@gmail.com"
$Password = "TestingPurpose_forStudents"

# Añadir dirección de correo de la persona en to & cc
$to = "testingpurpose201801@gmail.com"
$cc = "testingpupose201801@gmail.com"

$subject = "Email Subject"
$body = "Sear Sir/Madame,

        This is a system generated email. Please do not reply.

        Information: This is the important information
        Regards,
        Team XYZ
        "

$message = New-Object System.Net.Mail.MailMessage

$message.Subject = $subject
$message.body = $body
$message.to.Add($to)
$message.cc.Add($cc)
$message.from = "testingpurpose201801@gmial.com"

$message

$smtp = New-Object System.Net.Mail.SmtpClient($SMTPServer, $SMTPPort);

$smtp.EnableSsl = $true
$smtp.Credentials = New-Object System.Net.NetworkCredential($Username, $Password);

$smtp.Send($message);


# Reporte diario automatizado
# Detalles del usuario  y del servidor smtp.
$SMTPServer = "smpt.gmail.com"
$SMTPPort = "587"
$Username = "testingpurpose201801@gmail.com"
$Password = "TestingPurpose_forStudents"

# Añadir dirección de correo de la persona en to & cc
$to = "testingpurpose201801@gmail.com"
$cc = "testingpupose201801@gmail.com"

$subject = "System Performance Report || $(get-date)"

$service_to_monitor = @("VSS", "winRm", "TrustedInstaller", "Spooler", "msiserver")

$head = @"
<style>
h1,h5,th {text-align:center}
table{margin: auto;font-family:Seogoe UI;box-shadow:10px 10px 5px #888;border: thin ridge grey;}
th{background:#0046c3;color:#fff;max-width:400px;padding: 5px 10px;}
td{font-size:11px;padding:5px 20px;color:#000;}
tr{background:#b8d1f3;}
tr:nth-child(even){background:#dae5f4;}
tr:nth-child(odd){background:#b8d1f3;}
</style>
"@

# high CPU
$body = "<h1>Summary of process taking high CPU</h1>`n<h3>Updated: on $(Get-Date)</h3>"

#==================================================
#==================================================
#==================================================
$report = "system_performance.html";
Get-Process | Sort-Object cpu -Descending | Select-Object -First 10 | ConvertTo-Html -Property processname,id,cpu,ws,pm `
 -Head $head -Body $body | Out-File $report

 Write-Output "<br><br><br>" | Out-File $report -Append

 #High physical memory
 $body = "<h1>Summary of Process taking hign physical memory</h1>`n<h3>Updated: on $(get-date)</h3>"

 Get-Process | Sort-Object PM -Descending | Select-Object -First 10 | ConvertTo-Html -Property processname,id,cpu,ws,pm `
  -Body $body | Out-File $report -Append

 # Service Monitoring
 Write-Output "<br><br><br>" | Out-File $report -Append
 $body = "<h1>Services status</h1>`n<h3>Updated: on $(get-date)</h3>"

 Get-Service -Name $service_to_monitor | ConvertTo-Html -Property Name,DisplayName,Status,ServiceType,CanPauseAndContinue `
  -Body $body | Out-File $report -Append

#==============================================================
#==============================================================
#==============================================================

$BASE_DIR = (Resolve-Path .\).Path

$message = New-Object System.Net.Mail.MailMessage

$message.Subject = $subject

$message.to.Add($to)
$message.cc.Add($cc)

$message.body = Get-Content $report
$message.IsBodyHtml = $true

$message.from = "testingpurpose201801@gmial.com"

<#
If needed to send file as attachment
$attachment = $BASE_DIR + "\" + $report
$attach_log = new-object Net.Mail.Attachment($attachment)
$message.Attachment.Add($attachment)
#>

$message

$smtp = New-Object System.Net.Mail.SmtpClient($SMTPServer, $SMTPPort);

$smtp.EnableSsl = $true
$smtp.Credentials = New-Object System.Net.NetworkCredential($Username, $Password);

$smtp.Send($message);