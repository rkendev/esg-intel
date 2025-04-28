# ---------- base image ----------
FROM python:3.11-slim AS base

# ---------- metadata ------------
ARG ESG_BASE_VERSION
LABEL maintainer="rkendev <you@example.com>" \
      org.opencontainers.image.source="https://github.com/rkendev/esg-intel" \
      org.opencontainers.image.title="esg-base" \
      org.opencontainers.image.version="${ESG_BASE_VERSION:-local}"

# ---------- system deps ----------
RUN apt-get update && apt-get install -y --no-install-recommends \
        build-essential git curl libpq-dev && \
    rm -rf /var/lib/apt/lists/*

# ---------- python deps ----------
# Torch → cpu-only wheel to keep image light
RUN pip install --no-cache-dir \
        torch==2.2.0+cpu --index-url https://download.pytorch.org/whl/cpu

# NLP + PDF parsing
RUN pip install --no-cache-dir \
        spacy==3.7.4 \
        pdfminer.six==20231228 \
        scikit-learn==1.5.0 \
        pandas==2.2.2

# Download minimal spaCy model to avoid run-time fetch
RUN python -m spacy download en_core_web_sm

# ---------- non-root user ----------
RUN useradd -ms /bin/bash appuser
USER appuser
WORKDIR /app

CMD ["python3"]

