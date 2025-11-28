FROM python:3.11-slim

# Install D2 language
RUN apt-get update && apt-get install -y build-essential curl && \
    curl -fsSL https://d2lang.com/install.sh | sh && \
    apt-get remove --purge -y build-essential curl && apt-get autoremove -y && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

EXPOSE 8000

CMD ["mkdocs", "serve", "-a", "0.0.0.0:8000"]


