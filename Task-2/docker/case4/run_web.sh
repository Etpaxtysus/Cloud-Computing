#!/bin/sh

# Menghapus container jika ada
docker rm -f webserver1

# Menjalankan container web server dengan Flask
docker container run \
  -dit \
  --name webserver1 \
  --volume $(pwd)/files:/html \
  --volume $(pwd)/logs:/logs \
  --publish 8080:8080 \
  python:3.13-alpine \
  /bin/sh -c "
    pip install flask && \
    python3 /html/app.py"
