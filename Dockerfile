FROM python:3.11-slim

WORKDIR /workspace

COPY requirements.txt .
RUN pip install --no-cache-dir --upgrade pip \
    && pip install --no-cache-dir google-adk \
    && pip install --no-cache-dir -r requirements.txt

COPY . .

EXPOSE 8080

CMD ["adk", "api_server", "--host", "0.0.0.0", "--port", "8080", "--allow_origins", "*", "/workspace"]
