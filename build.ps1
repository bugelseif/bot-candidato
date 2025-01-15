$exclude = @("venv", "bot-candidato.zip")
$files = Get-ChildItem -Path . -Exclude $exclude
Compress-Archive -Path $files -DestinationPath "bot-candidato.zip" -Force