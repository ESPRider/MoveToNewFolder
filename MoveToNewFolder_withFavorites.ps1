
# MoveToNewFolder - v7_stable_plus
# https://github.com/ESPRider/MoveToNewFolder

Add-Type -AssemblyName System.Windows.Forms

$InstallPath = "C:\Scripts\MoveToNewFolder"
$LogPath = "$InstallPath\MoveToNewFolder.log"
$FavoritesPath = "$InstallPath\favorites.txt"
$LastUsedPath = "$InstallPath\lastused.txt"

function Write-Log($msg) {
    Add-Content -Path $LogPath -Value ("[{0}] {1}" -f (Get-Date -Format "yyyy-MM-dd HH:mm:ss"), $msg)
}

$ArgsFromShell = $args
Write-Log "ARGS passed in:`n" + ($ArgsFromShell -join "`n")

if (!$ArgsFromShell -or $ArgsFromShell.Count -eq 0) {
    [System.Windows.Forms.MessageBox]::Show("No files passed. Exiting.")
    exit
}

$favorites = @()
if (Test-Path $FavoritesPath) {
    $favorites = Get-Content $FavoritesPath | Where-Object { $_ -ne "" }
}
$lastUsed = ""
if (Test-Path $LastUsedPath) {
    $lastUsed = Get-Content $LastUsedPath -First 1
}
$script:selectedPath = $lastUsed

$form = New-Object System.Windows.Forms.Form
$form.Text = "Move to New Folder"
$form.Size = New-Object System.Drawing.Size(620, 540)
$form.StartPosition = "CenterScreen"
$form.AutoScroll = $true
$form.MinimumSize = $form.Size
$form.Topmost = $true

$labelFav = New-Object System.Windows.Forms.Label
$labelFav.Text = "Favorites:"
$labelFav.AutoSize = $true
$labelFav.Top = 10
$labelFav.Left = 10
$form.Controls.Add($labelFav)

$favBox = New-Object System.Windows.Forms.ListBox
$favBox.Width = 580
$favBox.Height = 160
$favBox.Top = 30
$favBox.Left = 10
$favBox.SelectionMode = "One"
$favBox.Items.AddRange($favorites)
$form.Controls.Add($favBox)

$delFavBtn = New-Object System.Windows.Forms.Button
$delFavBtn.Text = "Remove Favorite"
$delFavBtn.Width = 130
$delFavBtn.Top = 200
$delFavBtn.Left = 10
$delFavBtn.Add_Click({
    $sel = $favBox.SelectedItem
    if ($sel) {
        $favBox.Items.Remove($sel)
        $favorites = $favorites | Where-Object { $_ -ne $sel }
        Set-Content -Path $FavoritesPath -Value $favorites
        Write-Log "Removed favorite: $sel"
    }
})
$form.Controls.Add($delFavBtn)

$labelPath = New-Object System.Windows.Forms.Label
$labelPath.Text = "Selected path:"
$labelPath.AutoSize = $true
$labelPath.Top = 240
$labelPath.Left = 10
$form.Controls.Add($labelPath)

$pathBox = New-Object System.Windows.Forms.TextBox
$pathBox.Width = 580
$pathBox.Top = 260
$pathBox.Left = 10
$pathBox.Text = $script:selectedPath
$form.Controls.Add($pathBox)

$buttonPanel = New-Object System.Windows.Forms.FlowLayoutPanel
$buttonPanel.FlowDirection = "LeftToRight"
$buttonPanel.WrapContents = $true
$buttonPanel.AutoSize = $true
$buttonPanel.Top = 300
$buttonPanel.Left = 10
$buttonPanel.Width = 580
$form.Controls.Add($buttonPanel)

$browseBtn = New-Object System.Windows.Forms.Button
$browseBtn.Text = "Browse"
$browseBtn.Width = 100
$buttonPanel.Controls.Add($browseBtn)

$moveBtn = New-Object System.Windows.Forms.Button
$moveBtn.Text = "Move Files"
$moveBtn.Width = 100
$buttonPanel.Controls.Add($moveBtn)

$cancelBtn = New-Object System.Windows.Forms.Button
$cancelBtn.Text = "Cancel"
$cancelBtn.Width = 100
$cancelBtn.Add_Click({ $form.Close() })
$buttonPanel.Controls.Add($cancelBtn)

# Select from favorites
$favBox.Add_Click({
    if ($favBox.SelectedItem) {
        $pathBox.Text = $favBox.SelectedItem
        $script:selectedPath = $favBox.SelectedItem
    }
})

# Double-click to move
$favBox.Add_DoubleClick({
    if ($favBox.SelectedItem) {
        $script:selectedPath = $favBox.SelectedItem
        $pathBox.Text = $script:selectedPath
        $moveBtn.PerformClick()
    }
})

$browseBtn.Add_Click({
    $dialog = New-Object System.Windows.Forms.FolderBrowserDialog
    if ($dialog.ShowDialog() -eq "OK") {
        $script:selectedPath = $dialog.SelectedPath
        $pathBox.Text = $script:selectedPath
        if ($favorites -notcontains $script:selectedPath) {
            $res = [System.Windows.Forms.MessageBox]::Show(
                "Add this folder to favorites?",
                "Add to Favorites",
                [System.Windows.Forms.MessageBoxButtons]::YesNo,
                [System.Windows.Forms.MessageBoxIcon]::Question
            )
            if ($res -eq [System.Windows.Forms.DialogResult]::Yes) {
                Add-Content -Path $FavoritesPath -Value $script:selectedPath
                $favBox.Items.Add($script:selectedPath)
                $favorites += $script:selectedPath
            }
        }
    }
})

$moveBtn.Add_Click({
    $finalPath = $pathBox.Text.Trim()
    if (-not (Test-Path $finalPath)) {
        [System.Windows.Forms.MessageBox]::Show("Please enter or select a valid destination folder.")
        return
    }
    $finalPath | Set-Content $LastUsedPath
    $moved = 0
    foreach ($file in $ArgsFromShell) {
        if (Test-Path $file) {
            $dest = Join-Path $finalPath (Split-Path $file -Leaf)
            Move-Item -Path $file -Destination $dest -Force
            Write-Log "Moved: $file -> $dest"
            $moved++
        }
    }
    [System.Windows.Forms.MessageBox]::Show("Moved $moved file(s) to:`n$finalPath", "Done", [System.Windows.Forms.MessageBoxButtons]::OK, [System.Windows.Forms.MessageBoxIcon]::Information)
    $form.Close()
})

$linkGitHub = New-Object System.Windows.Forms.LinkLabel
$linkGitHub.Text = "View on GitHub"
$linkGitHub.Top = 460
$linkGitHub.Left = 10
$linkGitHub.Width = 90
$linkGitHub.Add_Click({ Start-Process "https://github.com/ESPRider/MoveToNewFolder" })
$form.Controls.Add($linkGitHub)

$linkLog = New-Object System.Windows.Forms.LinkLabel
$linkLog.Text = "Open Move Log"
$linkLog.Top = 460
$linkLog.Left = 100
$linkLog.Width = 200
$linkLog.Add_Click({
    if (Test-Path $LogPath) { Start-Process $LogPath }
    else { [System.Windows.Forms.MessageBox]::Show("No log file found.") }
})
$form.Controls.Add($linkLog)

$form.Add_Shown({ $form.Activate() })
[void]$form.ShowDialog()
