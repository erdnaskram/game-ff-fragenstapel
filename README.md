# Fragenstapel — Docker-Paket

Enthält alles, um die App über eine eigene URL laufen zu lassen (statt als
lokale Datei) und sie dadurch auf Android als "echte" App zu installieren.

## Inhalt

- `index.html` — die App selbst (inkl. Manifest-Link & Service-Worker-Registrierung)
- `manifest.json` — macht die Seite als PWA installierbar
- `service-worker.js` — cached die App beim ersten Laden, danach läuft sie offline
- `icon-192.png`, `icon-512.png`, `icon-512-maskable.png` — App-Icons
- `Dockerfile` — baut einen schlanken nginx-Container mit den Dateien
- `docker-compose.example.yml` — Beispiel-Service zum Einfügen in deinen Stack

## 1. In deinen Docker-Stack einbinden

1. Diesen ganzen Ordner (`fragenstapel-app/`) auf den Server kopieren, z. B.
   neben deine bestehende `docker-compose.yml`.
2. Den Service-Block aus `docker-compose.example.yml` in deine bestehende
   `docker-compose.yml` einfügen (oder als eigenen Stack in Portainer anlegen).
3. Je nachdem, ob du einen Reverse Proxy (z. B. Traefik) nutzt, Variante A
   (direkter Port) oder Variante B (Traefik-Labels) aktivieren — Details
   stehen als Kommentare in der Datei.
4. Stack neu deployen (`docker compose up -d --build` oder über Portainer).
5. **Wichtig für die Installation als App:** Die Seite muss über **HTTPS**
   erreichbar sein, sonst bietet Chrome auf Android keine echte Installation
   an (nur ein normales Lesezeichen). Mit Traefik + Let's Encrypt ist das
   automatisch der Fall.

## 2. Auf dem Android-Handy installieren

1. Die URL (z. B. `https://fragenstapel.deine-domain.tld`) in Chrome öffnen.
2. Menü (⋮) antippen → **"App installieren"** (oder "Zum Startbildschirm
   hinzufügen", je nach Chrome-Version).
3. Fertig — die App erscheint mit eigenem Icon auf dem Homescreen und
   startet ohne Adressleiste/Browser-Rahmen, wie eine normale App.
4. Nach dem ersten Öffnen (mit Internet) funktioniert sie dank Service
   Worker auch offline weiter.

## Ohne Docker: einfache lokale Nutzung

Die `index.html` funktioniert weiterhin auch einfach so per Doppelklick /
als heruntergeladene Datei im Browser — dann eben nur als Lesezeichen auf
dem Startbildschirm, nicht als vollwertig installierte App.
