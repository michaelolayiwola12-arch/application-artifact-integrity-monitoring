```powershell
# Generate baseline SHA256 hash for release artifact

Get-FileHash ./app_update_v3.4.2.zip -Algorithm SHA256 |
Select-Object -ExpandProperty Hash |
Set-Content ./release_hash.txt
