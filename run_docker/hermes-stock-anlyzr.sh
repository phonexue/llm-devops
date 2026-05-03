#!/bin/bash
docker run -d \
  --name hermes \
  --network host \
  --restart unless-stopped \
  ubuntu:hermes-agent \
  /root/.local/bin/hermes gateway run
