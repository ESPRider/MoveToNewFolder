# Move to New Folder Utility 🗂️

A lightweight Windows tool to quickly move selected files into a new folder — right from the **Send To** menu or Explorer context menu.
Skip the drag. Skip the copy. Just move your files directly with a right-click shortcut.
---

## ✨ Features

- 🖱️ Right-click any file(s) → **Send To → Move to New Folder**
- 📁 Choose the destination directory via folder picker
- ✅ Moves all selected files into that folder (no overwrites unless confirmed)
- 📦 Works with any file type
- 🧾 Creates a log of all moved files
- 🔇 Runs silently using a `.vbs` launcher (no black console window)


🔥 What Makes It Appealing?
Much faster than drag/drop or copy/paste

Prevents accidental clutter (no duplication)

Ideal for organizing downloads, photos, or work files

Works from anywhere in Windows Explorer

✅ Quick Win Features to Highlight
✅ Adds a custom "Move To Folder" in right-click > Send To
✅ Lightweight, portable, zero bloat
✅ Easy to configure or edit folders
---

## 📂 Installation

1. **Download the [Installer Package](./MoveToNewFolder_Installer_V2.zip)**  
2. Extract the archive
3. Right-click `Install_MoveToNewFolder.ps1` → **Run with PowerShell**

The script will:
- Create `C:\Scripts\MoveToNewFolder\` by default
- Copy all necessary files
- Add a **Send To** shortcut using a folder icon

> ✅ You can optionally change the installation path by running:
> ```powershell
> .\Install_MoveToNewFolder.ps1 -InstallPath "D:\Tools\MyFolderMover"
> ```

---

## 🛠 Components

| File                         | Purpose                                     |
|-----------------------------|---------------------------------------------|
| `MoveToNewFolder1.ps1`      | The main PowerShell script that moves files |
| `MoveToNewFolder1.bat`      | Simple launcher for the script              |
| `MoveToNewFolder.vbs`       | Silent minimized launcher for Send To       |
| `Install_MoveToNewFolder.ps1` | Installs everything and adds the shortcut  |

---

## 🧹 Uninstall

To uninstall:
- Delete the folder: `C:\Scripts\MoveToNewFolder`
- Remove the shortcut from: `shell:sendto`

---

## 🧠 Notes

- This tool filters itself out — it will never try to move the `.vbs` or `.bat` launcher
- File actions are logged to `MoveToNewFolder.log` in the install folder

---

## 📄 License

Personal use only — free for non-commercial use with attribution.  
Do not repurpose or redistribute commercially without explicit permission.  
GitHub: https://github.com/ESPRider/MoveToNewFolder  
© ESPRider
