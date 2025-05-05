# MoveToNewFolder - https://github.com/ESPRider/MoveToNewFolder
# Created by ESPRider
# Personal use only. Do not redistribute or repurpose commercially without attribution and license.

# Grab arguments directly from default PowerShell automatic variable
$ArgsFromShell = $args

$LogPath = "$PSScriptRoot\MoveToNewFolder.log"
function Write-Log($msg) {
    Add-Content -Path $LogPath -Value ("[{0}] {1}" -f (Get-Date -Format "yyyy-MM-dd HH:mm:ss"), $msg)
}

Write-Log "ARGS passed in:`n" + ($ArgsFromShell -join "`n")

if (!$ArgsFromShell -or $ArgsFromShell.Count -eq 0) {
    Write-Log "No files provided."
    Read-Host "No files passed. Press Enter to close."
    exit
}

Add-Type -AssemblyName System.Windows.Forms
$folderBrowser = New-Object System.Windows.Forms.FolderBrowserDialog
$folderBrowser.Description = "Select destination folder"
$folderBrowser.ShowNewFolderButton = $true

if ($folderBrowser.ShowDialog() -ne [System.Windows.Forms.DialogResult]::OK) {
    Write-Log "User canceled folder selection."
    exit
}

$targetDir = $folderBrowser.SelectedPath
$moved = 0

foreach ($file in $ArgsFromShell) {
    if (Test-Path $file) {
        $dest = Join-Path $targetDir (Split-Path $file -Leaf)
        Move-Item -Path $file -Destination $dest -Force
        Write-Log "Moved: $file -> $dest"
        $moved++
    }
}

[System.Windows.MessageBox]::Show("✅ Moved $moved file(s) to:`n$targetDir", "Move Complete", "OK", "Info")
