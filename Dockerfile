FROM python:3.12

WORKDIR /app

COPY . .

RUN pip install --no-cache-dir -r requirements.txt --timeout 180

# CMD ["python3", "-m", "http.server", "8000"]