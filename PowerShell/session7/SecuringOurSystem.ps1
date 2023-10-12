# Código para generar certificado
New-SelfSignedCertificate -Subject "CN=Test Code Signing" `
 -KeySpec "Signature" -KeyUsage "DigitalSignature" -FriendlyName "Test code signing" `
 -NotAfter $([datetime]::now.AddYears(5))

 # locación del certificado %APPDATA%\Microsoft\SystemCertificates\My\certificates

 $cert=(dir cert:currentuser\my\ -CodeSigningCert)
 $cert1=(dir Cert:\currentuser\My\CD01148B55649DFE80320AEA82D5DB6037E063F1)


 $cert1 | Get-Member

 $cert1 | select *

 # añadir certificado a script
 Set-AuthenticodeSignature 'D:\PowerShell\session7\sample.ps1' $cer1

 # validar certificado mmc.exe
 <#
    en la ventana emergente seleccionamos archivo --> agregar o quitar complementos

    seleccionamos certificados
    y en certificados agregamos el certificado
 #>