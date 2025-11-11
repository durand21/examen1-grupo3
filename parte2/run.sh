#!/usr/bin/env bash
set -euo pipefail

OUT="comandos.txt"
echo "# PARTE 2 — Dockerfile (Flask) — salidas reales" > "$OUT"
echo "# Fecha: $(date)" >> "$OUT"
echo >> "$OUT"

section() { echo -e "\n\n===== $* =====" | tee -a "$OUT"; }
cmd() { echo -e "\n$ " "$*" | tee -a "$OUT"; eval "$*" 2>&1 | tee -a "$OUT"; }

section "Build"
cmd "docker build -t mi-app-python:examen ."

section "Run"
cmd "docker run -d --name app-examen -p 5000:5000 -e PORT=5000 mi-app-python:examen"
sleep 3

section "Test"
cmd "curl -s http://localhost:5000/"
cmd "curl -s http://localhost:5000/salud"

section "Stop & Remove"
cmd "docker stop app-examen"
cmd "docker rm app-examen"

echo -e "\nHecho. Revisa 'comandos.txt' para ver comandos y salidas." | tee -a "$OUT"
