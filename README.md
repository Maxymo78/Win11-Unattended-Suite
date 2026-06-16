Markdown
# 🚀 Automated Windows 11 Unattended Suite

Select your language / Seleziona la lingua:
* 🇮🇹 [Italiano (#italiano)
* 🇬🇧 [English](#english)

---

## 🇮🇹 Italiano

Benvenuto! Questo progetto ti permette di creare un'installazione di Windows 11 completamente automatizzata, pulita e universale. Bypassa automaticamente i controlli hardware (TPM, SecureBoot, RAM), salta la richiesta del Product Key permettendoti di scegliere l'edizione, crea un utente Administrator locale ed esegue un'installazione silenziosa dei software essenziali direttamente dalla chiavetta USB.

Il progetto è pensato per essere leggero, trasparente e privo di tweak invasivi o personalizzazioni aziendali.

### ⚠️ Disclaimer / Avvertenze Legali
Questo progetto è stato creato esclusivamente a scopo didattico, di test e di studio personale. 
* Il bypass dei requisiti minimi hardware di Windows 11 (TPM, SecureBoot, RAM) potrebbe violare i termini di licenza d'uso di Microsoft.
* L'installazione di Windows 11 su hardware non supportato potrebbe comportare la mancata ricezione di aggiornamenti di sicurezza futuri o causare instabilità del sistema.
* L'autore di questo repository non si assume alcuna responsabilità per eventuali danni, perdite di dati, blocchi o problemi di qualsiasi natura derivanti dall'utilizzo dei file e degli script contenuti in questo progetto. L'utilizzo di questo materiale è a totale rischio e pericolo dell'utente finale.

### 📁 Struttura della Chiavetta USB
Per far funzionare correttamente l'automazione, i file devono essere disposti sulla chiavetta USB esattamente in questo modo:
```text
[Unità USB:\ (Radice)]
├── 📄 autounattend.xml        <-- Gestisce l'automazione iniziale e i bypass
├── 📁 sources/
│   ├── 📄 ei.cfg              <-- Sblocca il menu delle edizioni (Salta Product Key)
│   └── 📁 $OEM$/
│       └── 📁 $$ / 📁 Setup / 📁 Scripts /
│           └── 📄 SetupComplete.cmd  <-- Innesca il RunOnce sul desktop
└── 📁 TOOLS/
    ├── 📁 Apps/               <-- INSERISCI QUI I TUOI FILE .EXE / .MSI
    └── 📁 Script/
        ├── 📄 POST-DESKTOP.cmd
        └── 📄 INSTALLA TUTTO-TOOLS.bat
🛠️ Come Usare questo Progetto
1. Prepara il supporto d'installazione
Scarica la ISO ufficiale di Windows 11 e scrivi l'immagine su una chiavetta USB utilizzando Rufus. Questo passaggio creerà automaticamente una struttura di cartelle sulla tua USB, inclusa una cartella chiamata sources.

2. Copia i file dell'automazione
Scarica questo repository da GitHub (cliccando su Code -> Download ZIP) ed estrai il contenuto sul tuo computer.
Ora sposta i file sulla chiavetta USB in questo modo:

Prendi il file autounattend.xml e la cartella TOOLS e trascinali direttamente nella radice principale della tua chiavetta USB.

Apri la cartella sources del progetto che hai appena scaricato da GitHub, seleziona il file ei.cfg e la cartella $OEM$, e fai Copia.

Apri la cartella sources già presente sulla tua chiavetta USB (quella creata da Rufus) e fai Incolla al suo interno.

3. Aggiungi i tuoi Programmi (Fase Cruciale)
La cartella TOOLS\Apps scaricata da GitHub è vuota per motivi di licenza e dimensioni. Scarica i file di installazione dai siti ufficiali e incollali dentro TOOLS\Apps sulla tua chiavetta rispettando queste regole di nomenclatura:

7-Zip: Il file deve iniziare con 7z (es. 7z2408-x64.exe)

Adobe Reader: Il file deve iniziare con AcroRdr (es. AcroRdrDC2400220857_it_IT.exe)

Google Chrome: Scarica l'installer aziendale .msi e assicurati che contenga la parola Chrome

Mozilla Firefox: Scarica l'installer .msi e assicurati che contenga la parola Firefox

AnyDesk: Il file deve iniziare con AnyDesk (es. AnyDesk.exe)

4. Avvia l'installazione
Inserisci la chiavetta nel PC da formattare e avvia il boot da USB. L'installazione procederà in autonomia, ti chiederà solo quale edizione installare (Home, Pro, ecc.) e farà tutto il resto fino al desktop.

🇬🇧 English
Welcome! This project allows you to create a fully automated, clean, and universal Windows 11 installation media. It automatically bypasses hardware requirements (TPM, SecureBoot, RAM), skips the Product Key prompt allowing you to manually choose your preferred edition, creates a local Administrator user, and performs a silent installation of essential software directly from the USB drive.

This suite is designed to be lightweight, transparent, and completely free of invasive tweaks or third-party branding.

⚠️ Disclaimer / Legal Warning
This project is created solely for educational, testing, and personal research purposes.

Bypassing Windows 11 minimum hardware requirements (TPM, SecureBoot, RAM) may violate Microsoft's software license terms.

Installing Windows 11 on unsupported hardware might lead to a lack of future security updates or system instability.

The author of this repository assumes no responsibility for any damages, data loss, system crashes, or issues of any kind arising from the use of the files and scripts contained in this project. Use at your own risk.

📁 USB Drive Structure
To ensure the automation works correctly, the files must be arranged on your USB drive exactly as follows:

Plaintext
[USB Drive:\ (Root)]
├── 📄 autounattend.xml        <-- Handles initial automation and hardware bypasses
├── 📁 sources/
│   ├── 📄 ei.cfg              <-- Unlocks the edition selection menu (Skips Product Key)
│   └── 📁 $OEM$/
│       └── 📁 $$ / 📁 Setup / 📁 Scripts /
│           └── 📄 SetupComplete.cmd  <-- Triggers the post-desktop RunOnce script
└── 📁 TOOLS/
    ├── 📁 Apps/               <-- PLACE YOUR .EXE / .MSI INSTALLERS HERE
    └── 📁 Script/
        ├── 📄 POST-DESKTOP.cmd
        └── 📄 INSTALLA TUTTO-TOOLS.bat
🛠️ How to Use This Project
1. Prepare the installation media
Download the official Windows 11 ISO and burn the image to a USB flash drive using Rufus. This process will automatically generate the standard Windows folder structure on your USB, including a folder named sources.

2. Copy the automation files
Download this repository from GitHub (click on Code -> Download ZIP) and extract the contents to your computer.
Now transfer the files to the USB drive following these exact steps:

Select the autounattend.xml file and the TOOLS folder, then drag and drop them directly into the root directory of your USB flash drive.

Open the sources folder from the project files you just downloaded from GitHub, select the ei.cfg file and the $OEM$ folder, and click Copy.

Open the sources folder already existing on your USB drive (the one created by Rufus) and click Paste inside it.

3. Add Your Programs (Crucial Step)
The TOOLS\Apps folder downloaded from GitHub is empty due to licensing and size restrictions. Download the official installers from their respective websites and paste them into the TOOLS\Apps folder on your USB drive, adhering strictly to these naming rules:

7-Zip: The filename must start with 7z (e.g., 7z2408-x64.exe)

Adobe Reader: The filename must start with AcroRdr (e.g., AcroRdrDC2400220857_en_US.exe)

Google Chrome: Download the enterprise .msi installer and ensure the filename contains Chrome

Mozilla Firefox: Download the .msi installer and ensure the filename contains Firefox

AnyDesk: The filename must start with AnyDesk (e.g., AnyDesk.exe)

4. Start the installation
Insert the USB drive into the target PC and boot from it. The installation will run completely unattended; it will only prompt you to select your desired edition (Home, Pro, etc.) and handle everything else automatically up to the desktop.
