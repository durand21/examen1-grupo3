#!/usr/bin/env bash
set -euo pipefail

OUT="comandos.txt"
echo "# PARTE 3 — Docker Compose — salidas reales" > "$OUT"
echo "# Fecha: $(date)" >> "$OUT"
echo >> "$OUT"

section() { echo -e "\n\n===== $* =====" | tee -a "$OUT"; }
cmd() { echo -e "\n$ " "$*" | tee -a "$OUT"; eval "$*" 2>&1 | tee -a "$OUT"; }

section "Compose Up"
cmd "docker-compose up -d"
sleep 5

section "Compose PS"
cmd "docker-compose ps"

section "Test API"
cmd "curl -s http://localhost:3000/"
cmd "curl -s http://localhost:3000/salud"

section "Test Web (headers)"
cmd "curl -sI http://localhost:8080/"

section "Logs API (tail 100)"
cmd "docker-compose logs api --tail=100"

section "Compose Down (con volúmenes)"
cmd "docker-compose down -v"

echo -e "\nHecho. Revisa 'comandos.txt' para ver los comandos y salidas." | tee -a "$OUT"
