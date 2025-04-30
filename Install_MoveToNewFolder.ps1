
# Install_MoveToNewFolder.ps1
# Installer for MoveToNewFolder with Favorites
# Sets up directory, copies files, and adds shortcut to SendTo menu

$targetDir = "C:\Scripts\MoveToNewFolder"
$sendToDir = "$env:APPDATA\Microsoft\Windows\SendTo"

# Check for PowerShell
if (-not (Get-Command powershell -ErrorAction SilentlyContinue)) {
    [System.Windows.Forms.MessageBox]::Show("❌ Please install PowerShell. https://github.com/PowerShell/PowerShell.")
    exit
}

# Check for .NET Framework 4.5 or newer
try {
    $netVersion = Get-ItemPropertyValue 'HKLM:\\SOFTWARE\\Microsoft\\NET Framework Setup\\NDP\\v4\\Full' Release -ErrorAction Stop
    if ($netVersion -lt 378389) {
        [System.Windows.Forms.MessageBox]::Show("❌ .NET Framework 4.5 or newer is required. Please install it and try again. https://dotnet.microsoft.com/en-us/download/dotnet-framework/net48")
        exit
    }
} catch {
    [System.Windows.Forms.MessageBox]::Show("❌ .NET Framework could not be verified. Please install version 4.5 or newer. https://dotnet.microsoft.com/en-us/download/dotnet-framework/net48")
    exit
}


# Create the directory if it doesn't exist
if (-not (Test-Path $targetDir)) {
    New-Item -ItemType Directory -Path $targetDir | Out-Null
}

# Copy all files from current folder to target
$source = Split-Path -Parent $MyInvocation.MyCommand.Path
Copy-Item -Path "$source\MoveToNewFolder_withFavorites.ps1" -Destination $targetDir -Force
Copy-Item -Path "$source\MoveToNewFolderWFavorites.bat" -Destination $targetDir -Force
Copy-Item -Path "$source\MoveToNewFolder_withFavorites.vbs" -Destination $targetDir -Force

# Copy shortcut to SendTo folder
Copy-Item -Path "$source\Move with Favorites.lnk" -Destination $sendToDir -Force

Write-Host "✅ MoveToNewFolder installed to $targetDir"
Write-Host "✅ Shortcut added to SendTo menu"
pause
