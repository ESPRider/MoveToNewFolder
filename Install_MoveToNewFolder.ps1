param (
    [string]$InstallPath = "C:\Scripts\MoveToNewFolder"
)

Write-Output "Installing to $InstallPath..."

# Create install folder
if (!(Test-Path -Path $InstallPath)) {
    New-Item -Path $InstallPath -ItemType Directory | Out-Null
}

# Copy script files
Copy-Item -Path "$PSScriptRoot\MoveToNewFolder1.ps1" -Destination "$InstallPath\MoveToNewFolder.ps1" -Force
Copy-Item -Path "$PSScriptRoot\MoveToNewFolder1.bat" -Destination "$InstallPath\MoveToNewFolder.bat" -Force
Copy-Item -Path "$PSScriptRoot\MoveToNewFolder.vbs" -Destination "$InstallPath\MoveToNewFolder.vbs" -Force

# Create SendTo shortcut to VBS
$WshShell = New-Object -ComObject WScript.Shell
$SendTo = [Environment]::GetFolderPath("SendTo")
$Shortcut = $WshShell.CreateShortcut("$SendTo\Move to New Folder.lnk")
$Shortcut.TargetPath = "$InstallPath\MoveToNewFolder.vbs"
$Shortcut.IconLocation = "imageres.dll,3"  # Classic folder icon
$Shortcut.Save()

Write-Output "Installation complete. Shortcut added to SendTo menu."
