<!-- README.md -->

[![CI](https://github.com/rkendev/esg-intel/actions/workflows/ci.yml/badge.svg)](https://github.com/rkendev/esg-intel/actions/workflows/ci.yml)

# ESG-Intel

NLP-powered ESG-disclosure analytics – detects green-washing, produces interpretable scores, and serves them via API & dashboard.

[![Base image build](https://github.com/rkendev/esg-intel/actions/workflows/docker-base.yml/badge.svg?branch=main)](https://github.com/rkendev/esg-intel/actions/workflows/docker-base.yml)  
[![Lint](https://github.com/rkendev/esg-intel/actions/workflows/lint.yml/badge.svg?branch=main)](https://github.com/rkendev/esg-intel/actions/workflows/lint.yml)

> **ESG-Intel** provides AI-powered environmental, social & governance document analysis in a single container image.

---

### Base image

* **Latest tag** – `docker pull ghcr.io/rkendev/esg-base:latest`  
* **Pinned digest** – `docker pull ghcr.io/rkendev/esg-base@sha256:d3981ab06a759134d51715abe2037741d31be09b`

**Contains**

* Python 3.11-slim  
* PyTorch 2.2 (CPU)  
* spaCy 3.7 + `en_core_web_sm`  
* pandas, scikit-learn, pdfminer.six  
* System libs for compiling common Python packages

---

### Project structure

| Path | Purpose |
|------|---------|
| `infra/Dockerfile` | Build script for the base image |
| `.github/workflows/docker-base.yml` | CI to build & push the image |
| `.github/workflows/lint.yml` | Code-style checks |
| `src/…` | Application code (coming soon) |

---

### Contributing

1. Fork & branch from **`main`**  
2. Run **`make lint && make test`** locally  
3. Open a pull request — CI will build the Docker image (without pushing) and run linters.

---

### License

MIT © 2024 Richard Kende (rkendev) — see **`LICENSE`** for details.
