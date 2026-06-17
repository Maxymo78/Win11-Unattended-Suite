# 🚀 Automated Windows 11 Unattended Suite

Welcome! This project allows you to create a fully automated, clean, and universal Windows 11 installation media. It automatically bypasses hardware requirements (TPM, Secure Boot, RAM) and skips unnecessary interactive steps, providing a straightforward unattended installation and silent post-install software setup.

This suite is designed to be lightweight, transparent, and completely free of invasive tweaks or third-party branding.

⚠️ Disclaimer / Legal Warning
This project is created solely for educational, testing, and personal research purposes.
- Bypassing Windows 11 minimum hardware requirements (TPM, Secure Boot, RAM) may violate Microsoft's software license terms.
- Installing Windows 11 on unsupported hardware might lead to a lack of future security updates or system instability.
- The author of this repository assumes no responsibility for any damages, data loss, system crashes, or issues of any kind arising from the use of the files and scripts contained in this project.

📁 USB Drive Structure
To ensure the automation works correctly, the files must be arranged on your USB drive exactly as follows:

[USB Drive:\ (Root)]
├── autounattend.xml        <-- Handles initial automation and hardware bypasses
├── sources/
│   ├── ei.cfg              <-- Unlocks the edition selection menu (Skips Product Key)
│   └── $OEM$/
│       └── $$ / Setup / Scripts /
│           └── SetupComplete.cmd  <-- Triggers the post-desktop RunOnce script
└── TOOLS/
    ├── Apps/               <-- PLACE YOUR .EXE / .MSI INSTALLERS HERE
    └── Script/
        ├── POST-DESKTOP.cmd
        └── INSTALLA TUTTO-TOOLS.bat

🛠️ How to Use This Project
1. Prepare the installation media
   - Download the official Windows 11 ISO and write the image to a USB flash drive using Rufus. This will create the standard Windows folder structure on your USB, including a `sources` folder.

2. Copy the automation files
   - Download this repository (Code -> Download ZIP) and extract.
   - Move `autounattend.xml` and the `TOOLS` folder to the root of the USB drive.
   - From the repository's `sources` folder, copy `ei.cfg` and the `$OEM$` folder into the `sources` folder already present on the USB (created by Rufus).

3. Add your programs (Crucial)
   - `TOOLS/Apps` is empty in the repo due to licensing/size. Download official installers and place them into `TOOLS/Apps`.
   - Examples of expected filenames:
     - 7-Zip: filename starts with `7z` (e.g., `7z2408-x64.exe`)
     - Adobe Reader: starts with `AcroRdr` or similar
     - Google Chrome: enterprise `.msi` containing `Chrome`
     - Mozilla Firefox: `.msi` containing `Firefox`
     - AnyDesk: filename starts with `AnyDesk.exe`

4. Start the installation
   - Boot the target PC from the USB drive. The installation will run unattended; it will prompt only to choose the Windows edition and then proceed automatically.

(You can keep the Italian README as-is; this file is a standalone English version.)
