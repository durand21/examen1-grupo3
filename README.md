# Examen Grupo 3

Esta carpeta cumple la estructura exacta del examen y trae **scripts opcionales** `run.sh` para llenar automáticamente los `comandos.txt` con salidas reales.

## Estructura
```
david-joel-rivas-ortega-examen/
├── parte1/
│   ├── comandos.txt     
│   └── run.sh            
├── parte2/
│   ├── Dockerfile
│   ├── app.py
│   ├── requirements.txt
│   ├── .dockerignore
│   ├── comandos.txt
│   └── run.sh            
└── parte3/
    ├── docker-compose.yml
    ├── api/
    │   ├── Dockerfile    
    │   ├── server.js
    │   └── package.json
    ├── web/
    │   └── index.html
    ├── comandos.txt
    └── run.sh            
```

## Requisitos previos
- Docker y Docker Compose instalados
- `curl` disponible para pruebas HTTP
- Puertos **3000**, **5000**, **8080** libres (y **8081** si usas Mongo Express)

## Pasos rápidos
### Parte 1 (CLI)
```bash
cd parte1
bash run.sh     
```

