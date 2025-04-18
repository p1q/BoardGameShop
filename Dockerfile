FROM python:3.13-slim

ENV PYTHONUNBUFFERED=1

WORKDIR /app

COPY requirements.txt .
RUN pip install --upgrade pip && \
    pip install --no-cache-dir -r requirements.txt

RUN echo "→ building with UPDATED Dockerfile"

COPY . .

ENTRYPOINT []

CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
