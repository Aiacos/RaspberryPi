# Raspberry Pi OS Setup Script

## Utilizzo

1. Copia il file template:
   ```bash
   cp init.sh.template init.sh
   ```

2. Modifica `init.sh` sostituendo i placeholder con le tue credenziali:
   - `YOUR_EMAIL`: la tua email Speedify
   - `YOUR_PASSWORD`: la tua password Speedify
   - `YOUR_WIFI_PASSWORD`: la password per l'access point WiFi

3. Esegui lo script:
   ```bash
   chmod +x init.sh
   ./init.sh
   ```

## IMPORTANTE

⚠️ **NON committare mai il file `init.sh` con le credenziali reali!**

Il file `init.sh` è già incluso nel `.gitignore` per prevenire commit accidentali.
Usa sempre il template `init.sh.template` per condividere la configurazione.
