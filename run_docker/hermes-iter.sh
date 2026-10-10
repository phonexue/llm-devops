#!/bin/bash
docker run -d \
  --name hermes-iter \
  --restart unless-stopped \
  -v ~/.hermes-iter:/opt/data \
  -v ~/.data-shared:/opt/shared \
  -e TZ=Asia/Shanghai \
  -e PATH=/opt/hermes/.venv/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin \
  -p 8642:8642 \
  nousresearch/hermes-agent \
  gateway run
