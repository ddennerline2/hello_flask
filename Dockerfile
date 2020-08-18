FROM python:3.8-slim-buster

RUN apt-get update
RUN apt-get install binutils --assume-yes

ENV FLASK_APP app.py
ENV FLASK_RUN_HOST 0.0.0.0
ENV FLASK_RUN_PORT 5000

WORKDIR /app
ADD . /app/

RUN pip install --upgrade pip
RUN pip install -r requirements.txt

CMD ["flask", "run"]
