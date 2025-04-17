FROM python:3.13-slim

WORKDIR /app

RUN apt-get update \
 && apt-get install -y --no-install-recommends \
      gcc libpq-dev ca-certificates \
 && rm -rf /var/lib/apt/lists/*

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

RUN python manage.py collectstatic --noinput
EXPOSE 8000
CMD ["gunicorn", "board_game_shop.wsgi:application", "--bind", "0.0.0.0:8000"]
