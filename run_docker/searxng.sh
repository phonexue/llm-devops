#!/bin/bash
docker run --name searxng -d \
    -p 8888:8080 \
    -v "$HOME/searxng/config/:/etc/searxng/" \
    -v "$HOME/searxng/data/:/var/cache/searxng/" \
    docker.io/searxng/searxng:latest
