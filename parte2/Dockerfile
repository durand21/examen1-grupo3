# syntax=docker/dockerfile:1
FROM python:3.11-slim

ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1 \
    PORT=5000

WORKDIR /app

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# app codigo
COPY app.py .


RUN useradd -m appuser
USER appuser

EXPOSE 5000


HEALTHCHECK --interval=30s --timeout=3s --retries=3 CMD python -c "import os,sys,urllib.request; port=os.getenv('PORT','5000'); sys.exit(0) if urllib.request.urlopen('http://127.0.0.1:'+port+'/salud', timeout=2).status==200 else sys.exit(1)"

CMD ["python", "app.py"]
