# Examen Docker — David Joel Rivas Ortega

Esta carpeta cumple la estructura exacta del examen y trae **scripts opcionales** `run.sh` para llenar automáticamente los `comandos.txt` con salidas reales.

## Estructura
```
david-joel-rivas-ortega-examen/
├── parte1/
│   ├── comandos.txt      # comandos y script opcional para evidencias
│   └── run.sh            # (opcional) llena comandos.txt con salidas reales
├── parte2/
│   ├── Dockerfile
│   ├── app.py
│   ├── requirements.txt
│   ├── .dockerignore
│   ├── comandos.txt
│   └── run.sh            # (opcional) construye, corre, prueba y documenta
└── parte3/
    ├── docker-compose.yml
    ├── api/
    │   ├── Dockerfile    # multi-stage (punto extra)
    │   ├── server.js
    │   └── package.json
    ├── web/
    │   └── index.html
    ├── comandos.txt
    └── run.sh            # (opcional) levanta, prueba, logs y limpia
```

## Requisitos previos
- Docker y Docker Compose instalados
- `curl` disponible para pruebas HTTP
- Puertos **3000**, **5000**, **8080** libres (y **8081** si usas Mongo Express)

## Pasos rápidos
### Parte 1 (CLI)
```bash
cd parte1
bash run.sh     # o copia/pega desde comandos.txt
```

