FROM nginx:alpine

# Statische Dateien der App
COPY index.html /usr/share/nginx/html/index.html
COPY manifest.json /usr/share/nginx/html/manifest.json
COPY service-worker.js /usr/share/nginx/html/service-worker.js
COPY icon-512.png /usr/share/nginx/html/icon-512.png

EXPOSE 80
