Set shell = CreateObject("WScript.Shell")
Set args = WScript.Arguments

batPath = "C:\Scripts\MoveToNewFolderAdvanced\MoveToNewFolder_withFavorites.bat"

command = """" & batPath & """"
For i = 0 To args.Count - 1
    command = command & " """ & args(i) & """"
Next

shell.Run command, 7, False
