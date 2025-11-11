#!/usr/bin/env bash
set -euo pipefail

OUT="comandos.txt"
echo "# PARTE 1 — Docker CLI y Comandos Básicos (salidas reales)" > "$OUT"
echo "# Fecha: $(date)" >> "$OUT"
echo >> "$OUT"

section() { echo -e "\n\n===== $* =====" | tee -a "$OUT"; }
cmd() { echo -e "\n$ " "$*" | tee -a "$OUT"; eval "$*" 2>&1 | tee -a "$OUT"; }

section "1.1 Gestión de Contenedores — nginx:alpine"
cmd "docker pull nginx:alpine"
cmd "docker run -d --name web-examen -p 8080:80 nginx:alpine"
sleep 2
cmd "docker ps --filter name=web-examen"
cmd "docker logs --tail 20 web-examen"
IP=$(docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' web-examen || true)
echo -e "\nIP del contenedor web-examen: ${IP}" | tee -a "$OUT"
cmd "docker stop web-examen"
cmd "docker rm web-examen"

section "1.2 Volúmenes y Persistencia — Postgres"
cmd "docker volume create datos-examen"
cmd "docker run -d --name db-examen -e POSTGRES_PASSWORD=examen123 -e POSTGRES_DB=testdb -v datos-examen:/var/lib/postgresql/data -p 5432:5432 postgres:15-alpine"
sleep 5
cmd "docker ps --filter name=db-examen"
cmd "docker logs --tail 50 db-examen"
cmd "docker exec -i db-examen psql -U postgres -d testdb -c \"CREATE TABLE IF NOT EXISTS prueba_examen(id SERIAL PRIMARY KEY, nombre TEXT);\""
cmd "docker stop db-examen"
cmd "docker rm db-examen"
cmd "docker run -d --name db-examen -e POSTGRES_PASSWORD=examen123 -e POSTGRES_DB=testdb -v datos-examen:/var/lib/postgresql/data -p 5432:5432 postgres:15-alpine"
sleep 5
cmd \"docker exec -i db-examen psql -U postgres -d testdb -c \\\"\\dt\\\"\"

echo -e "\nHecho. Revisa 'comandos.txt' para ver todos los comandos y salidas." | tee -a "$OUT"
