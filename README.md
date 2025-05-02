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

1. **Download the [Installer Package](https://github.com/ESPRider/MoveToNewFolder/archive/refs/heads/Advanced.zip)**  
2. Extract the archive
3. Right-click `CLICK_HERE_TO_INSTALL.bat`
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

MIT License

Copyright (c) [2025] [Elliot Porter]

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell   
copies of the Software, and to permit persons to whom the Software is        
furnished to do so, subject to the following conditions:                     

The above copyright notice and this permission notice shall be included in   
all copies or substantial portions of the Software.                          

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR   
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,     
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE  
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER      
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING     
FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER         
DEALINGS IN THE SOFTWARE. 

# Terms of Use

By using this software, you agree to the following terms:

- This application is intended for **personal, non-commercial use only**.
- You may not modify and redistribute the software for commercial gain without explicit permission.
- The application is provided **as-is**, without warranties or guarantees of any kind.
- The developer is **not liable** for any damages, data loss, or legal issues resulting from use.
- No data is collected, stored, or transmitted by this application.

By continuing to use the application, you accept these terms.

- 🔒 This app does **not** collect or transmit any user data.

## 💖 Support Development

If you’d like to support the project, donations are welcome:

👉 [Donate via PayPal] https://www.paypal.com/ncp/payment/BPNXF8V8MHPFY  
(This is completely optional. The app is and will remain free.)
