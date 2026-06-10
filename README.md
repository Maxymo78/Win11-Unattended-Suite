# 🚀 Automated Windows 11 Unattended Suite

Benvenuto! Questo progetto ti permette di creare un'installazione di Windows 11 completamente automatizzata, pulita e universale. Bypassa automaticamente i controlli hardware (TPM, SecureBoot, RAM), salta la richiesta del Product Key permettendoti di scegliere l'edizione, crea un utente Administrator locale ed esegue un'installazione silenziosa dei software essenziali direttamente dalla chiavetta USB.

Il progetto è pensato per essere leggero, trasparente e privo di tweak invasivi o personalizzazioni aziendali.

---

## ⚠️ Disclaimer / Avvertenze Legali

Questo progetto è stato creato esclusivamente a scopo didattico, di test e di studio personale. 
* Il bypass dei requisiti minimi hardware di Windows 11 (TPM, SecureBoot, RAM) potrebbe violare i termini di licenza d'uso di Microsoft.
* L'installazione di Windows 11 su hardware non supportato potrebbe comportare la mancata ricezione di aggiornamenti di sicurezza futuri o causare instabilità del sistema.
* L'autore di questo repository non si assume alcuna responsabilità per eventuali danni, perdite di dati, blocchi o problemi di qualsiasi natura derivanti dall'utilizzo dei file e degli script contenuti in questo progetto. L'utilizzo di questo materiale è a totale rischio e pericolo dell'utente finale.

---

## 📁 Struttura della Chiavetta USB

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

In questo modo non sovrascriverai l'intera cartella di Rufus e i file dell'automazione si troveranno esattamente nel posto giusto!

3. Aggiungi i tuoi Programmi (Fase Cruciale)
La cartella TOOLS\Apps scaricata da GitHub è vuota per motivi di licenza e dimensioni. Scarica i file di installazione dai siti ufficiali e incollali dentro TOOLS\Apps sulla tua chiavetta rispettando queste regole di nomenclatura:

7-Zip: Il file deve iniziare con 7z (es. 7z2408-x64.exe)

Adobe Reader: Il file deve iniziare con AcroRdr (es. AcroRdrDC2400220857_it_IT.exe)

Google Chrome: Scarica l'installer aziendale .msi e assicurati che contenga la parola Chrome

Mozilla Firefox: Scarica l'installer .msi e assicurati che contenga la parola Firefox

AnyDesk: Il file deve iniziare con AnyDesk (es. AnyDesk.exe)

Nota: Lo script utilizza dei filtri generici (es. 7z*.exe), quindi non importa la versione precisa che scaricherai, l'importante è l'inizio del nome.

4. Avvia l'installazione
Inserisci la chiavetta nel PC da formattare e avvia il boot da USB. L'installazione procederà in autonomia, ti chiederà solo quale edizione installare (Home, Pro, ecc.) e farà tutto il resto fino al desktop, dove si aprirà la barra di avanzamento che installerà le tue app!
