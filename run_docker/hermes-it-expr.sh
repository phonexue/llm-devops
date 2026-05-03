#!/bin/bash
docker run -d \
  --name hermes-it \
  --network host \
  --memory=4096m \
  --cpus=2 \
  --pids-limit=64 \
  --restart unless-stopped \
  ubuntu:hermes-agent \
  /root/.local/bin/hermes gateway run
