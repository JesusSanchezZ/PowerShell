# Logica:
Write-Host "This statement is my favorite statement" -ForegroundColor Black -BackgroundColor DarkCyan
Write-Host "this is world's most stupid statement1" -ForegroundColor Red -BackgroundColor DarkCyan
Write-Host "This statement is my favorite statement" -ForegroundColor Black -BackgroundColor DarkCyan

# An unecessary for loop
$sentence = @("Most", "Stop", "logic")
foreach($word in $sentence){
    Write-Output $word
}

# Creacion de IseSnippet
New-IseSnippet -Title comment-BaseHelp -Description "A template for comment-based help" -Text @"
# Logica:
Write-Host "This statement is my favorite statement" -ForegroundColor Black -BackgroundColor DarkCyan
Write-Host "this is world's most stupid statement1" -ForegroundColor Red -BackgroundColor DarkCyan
Write-Host "This statement is my favorite statement" -ForegroundColor Black -BackgroundColor DarkCyan

# An unecessary for loop
$sentence = @("Most", "Stop", "logic")
foreach($word in $sentence){
    Write-Output $word
}
"@

Get-IseSnippet

# localización : C:\Users\{user name}\Documents\WindowsPowerShell\Snippets

