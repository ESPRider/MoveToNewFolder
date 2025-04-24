' MoveToNewFolder - https://github.com/ESPRider/MoveToNewFolder
' Created by ESPRider
' Personal use only. Do not redistribute or repurpose commercially without attribution and license.

Set shell = CreateObject("WScript.Shell")
Set args = WScript.Arguments

batPath = "C:\Scripts\MoveToNewFolder\MoveToNewFolder.bat"

command = """" & batPath & """"
For i = 0 To args.Count - 1
    command = command & " """ & args(i) & """"
Next

shell.Run command, 7, False
