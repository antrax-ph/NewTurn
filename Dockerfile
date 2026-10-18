FROM mcr.microsoft.com/playwright/python:v1.48.0-jammy

WORKDIR /app

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY turnstile_solver.py .

ENV PORT=5000 \
    HEADLESS=true \
    BROWSER_TYPE=chromium \
    THREAD_COUNT=2 \
    DEBUG=true

EXPOSE 5000

CMD ["sh", "-c", "hypercorn turnstile_solver:app -b 0.0.0.0:${PORT}"]