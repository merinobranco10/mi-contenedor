# Imagen base ligera de Python
FROM python:3.12-slim

# Evita archivos .pyc y activa logs inmediatos
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

# Directorio de trabajo
WORKDIR /app

# Actualiza paquetes del sistema
RUN apt-get update \
    && apt-get upgrade -y \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Copia la aplicación
COPY app.py .

# Ejecuta como usuario sin privilegios
RUN useradd --create-home appuser \
    && chown -R appuser:appuser /app
USER appuser

# Puerto de la aplicación
EXPOSE 8080

CMD ["python", "app.py"]
