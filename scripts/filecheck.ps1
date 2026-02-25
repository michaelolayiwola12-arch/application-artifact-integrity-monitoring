# Verify file integrity before release

$baselineHash = Get-Content ./release_hash.txt
$currentHash = (Get-FileHash ./app_update_v3.4.2.zip -Algorithm SHA256).Hash

if ($baselineHash -eq $currentHash) {
    Write-Output "This file is correct. No corrective action needed."
}
else {
    Write-Output "This file has changed. Corrective action initiated."
}
