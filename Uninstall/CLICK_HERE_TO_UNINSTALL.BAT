@echo off
reg import "%~dp0UninstallRegistry_MoveToFolder.reg"
echo Registry Entry Removed
powershell.exe -NoProfile -ExecutionPolicy Bypass -File "%~dp0Uninstall_script.ps1"
pause
