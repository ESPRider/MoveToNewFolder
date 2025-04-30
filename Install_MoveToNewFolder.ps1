param (
    [string]$InstallPath = "C:\Scripts\MoveToNewFolder"
)

Write-Output "Installing to $InstallPath..."

# Create install folder
if (!(Test-Path -Path $InstallPath)) {
    New-Item -Path $InstallPath -ItemType Directory | Out-Null
}

# Copy script files
Copy-Item -Path "$PSScriptRoot\MoveToNewFolder_withFavorites.ps1" -Destination "$InstallPath\MoveToNewFolder_withFavorites.ps1" -Force
Copy-Item -Path "$PSScriptRoot\MoveToNewFolder_withFavorites.bat" -Destination "$InstallPath\MoveToNewFolder_withFavorites.bat" -Force
Copy-Item -Path "$PSScriptRoot\MoveToNewFolder_withFavorites.vbs" -Destination "$InstallPath\MoveToNewFolder_withFavorites.vbs" -Force

# Create SendTo shortcut to VBS
$WshShell = New-Object -ComObject WScript.Shell
$SendTo = [Environment]::GetFolderPath("SendTo")
$Shortcut = $WshShell.CreateShortcut("$SendTo\Move to New Folder with Favorites.lnk")
$Shortcut.TargetPath = "$InstallPath\MoveToNewFolder_withFavorites.vbs"
$Shortcut.IconLocation = "imageres.dll,3"  # Classic folder icon
$Shortcut.Save()

Write-Output "Installation complete. Shortcut added to SendTo menu."
