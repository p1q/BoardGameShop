FROM python:3.13-slim

ENV PYTHONUNBUFFERED=1
ENV PATH="/root/.local/bin:$PATH"

WORKDIR /app

COPY requirements.txt .
RUN pip install --upgrade pip && \
    pip install --no-cache-dir -r requirements.txt

RUN pip install --no-cache-dir gunicorn

COPY . .

RUN pip show gunicorn && echo "$PATH"
CMD ["gunicorn", "board_game_shop.wsgi:application", "--bind", "0.0.0.0:8000"]
