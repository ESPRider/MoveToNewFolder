Add-Type -AssemblyName System.Windows.Forms

$installPath = "C:\Scripts\MoveToNewFolderAdvanced"
$sendToPath = "$env:APPDATA\Microsoft\Windows\SendTo\Move with Favorites.lnk"

$errors = @()

# Confirm uninstall
$response = [System.Windows.Forms.MessageBox]::Show(
    "Do you want to uninstall MoveToNewFolder?",
    "Confirm Uninstall",
    [System.Windows.Forms.MessageBoxButtons]::YesNo,
    [System.Windows.Forms.MessageBoxIcon]::Question
)
if ($response -ne 'Yes') { exit }

# Ask about deleting SendTo shortcut
$deleteShortcut = [System.Windows.Forms.MessageBox]::Show(
    "Delete the SendTo shortcut?",
    "Shortcut Removal",
    [System.Windows.Forms.MessageBoxButtons]::YesNo,
    [System.Windows.Forms.MessageBoxIcon]::Question
)

# Ask about deleting install folder
$deleteFolder = [System.Windows.Forms.MessageBox]::Show(
    "Delete the installation folder and all contents?",
    "Delete Folder",
    [System.Windows.Forms.MessageBoxButtons]::YesNo,
    [System.Windows.Forms.MessageBoxIcon]::Warning
)

# Remove shortcut if chosen
if ($deleteShortcut -eq 'Yes' -and (Test-Path $sendToPath)) {
    try { Remove-Item $sendToPath -Force } catch { $errors += "Shortcut: $_" }
}

# Remove folder if chosen
if ($deleteFolder -eq 'Yes' -and (Test-Path $installPath)) {
    try { Remove-Item $installPath -Recurse -Force } catch { $errors += "Folder: $_" }
}

# Result message
if ($errors.Count -eq 0) {
    [System.Windows.Forms.MessageBox]::Show("✅ Uninstall completed successfully.", "Done", "OK", "Info")
} else {
    [System.Windows.Forms.MessageBox]::Show("⚠ Uninstall completed with errors:`n`n" + ($errors -join "`n"), "Partial Uninstall", "OK", "Warning")
}
