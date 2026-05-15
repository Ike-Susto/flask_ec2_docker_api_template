# Stage 1: dev
FROM python:3.11-slim AS dev

RUN apt-get update \
    && apt-get install -y --no-install-recommends git \ 
    && apt-get install -y --no-install-recommends curl \
    && rm -rf /var/lib/apt/lists/*

COPY *.txt .
RUN pip install --no-cache-dir -r requirements-dev.txt

WORKDIR /app

COPY app/ .

RUN useradd --create-home appuser
USER appuser

EXPOSE 8000

VOLUME ["/var/log"]

# Stage 2: prod
FROM python:3.11-slim AS prod

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

WORKDIR /app

COPY app/ .

RUN useradd --create-home appuser \
    && mkdir -p /var/log/microservice \
    && chown -R appuser:appuser /var/log/microservice
USER appuser

EXPOSE 8001

VOLUME ["/var/log"]

CMD ["gunicorn", "--bind", "0.0.0.0:8001", "--access-logfile", "/var/log/microservice/access.log", "--error-logfile", "/var/log/microservice/error.log", "--capture-output", "main:app"]