#!/bin/bash
docker run -d \
  --name hermes-anlyzer \
  --restart unless-stopped \
  -v ~/.hermes-anlyzer:/opt/data \
  -v ~/.data-shared:/opt/shared \
  -e TZ=Asia/Shanghai \
  -e PATH=/opt/hermes/.venv/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin \
  -p 8643:8642 \
  nousresearch/hermes-agent \
  gateway run
