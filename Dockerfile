FROM python:3.12-slim

ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

WORKDIR /app

RUN apt-get update \
    && apt-get upgrade -y \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

COPY app.py .

RUN useradd --create-home appuser \
    && chown -R appuser:appuser /app

# Control de seguridad: ejecutar sin privilegios de root
USER appuser

EXPOSE 8080

CMD ["python", "app.py"]
