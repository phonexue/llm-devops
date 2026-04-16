#!/bin/bash
docker run --rm -dt \
  --name hermes \
  --network host \
  --restart unless-stopped \
  ubuntu:hermes-agent \
  /root/.local/bin/hermes gateway run
