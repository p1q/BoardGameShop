FROM python:3.13-slim

ENV PYTHONUNBUFFERED=1
ENV PATH="/usr/local/bin:$PATH"

WORKDIR /app

COPY requirements.txt .
RUN pip install --upgrade pip && \
    pip install --no-cache-dir -r requirements.txt

COPY . .

CMD ["gunicorn", "boardgameshop.wsgi:application", "--bind", "0.0.0.0:8000"]
