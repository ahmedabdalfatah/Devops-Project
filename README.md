# My First Dockerized App

A Flask web application containerized with Docker.
Built as part of a hands-on DevOps learning path.

## Tech stack
- Python 3.12 + Flask
- Docker (multi-layer build, .dockerignore)
- Gunicorn (production WSGI server)

## Run locally with Docker

```bash
docker build -t my-flask-app:v1 .
docker run -d -p 10443:5000 my-flask-app:v1
```

Then open http://localhost:10443



