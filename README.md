This repository contains a simple Docker service that can be used for Kubernetes testing.

# Run flask locally
The steps below are only meant to debug the local flask application. The Docker steps below
should be used for the book.
- `python3 -m venv ./venv`
- `./venv/bin/pip install --upgrade pip`
- `./venv/bin/pip install -r requirements.txt`
- `docker run --name some-redis -d redis`
- `./venv/bin/flask run`

# Docker
- Run `docker-compose up -d`
- Start browser and connect to `http://localhost:5000`
