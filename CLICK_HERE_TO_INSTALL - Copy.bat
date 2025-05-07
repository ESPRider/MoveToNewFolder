@echo off
powershell.exe -NoProfile -ExecutionPolicy Bypass -File "%~dp0scripts/Install_MoveToNewFolder.ps1"
reg import "%~dp0scripts\RegistryAdd_MoveToNewFolder.reg"

pause
