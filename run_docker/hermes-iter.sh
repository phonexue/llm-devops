#!/bin/bash
docker run -d \
  --name hermes-iter \
  --restart unless-stopped \
  -v ~/.hermes-iter:/opt/data \
  -e TZ=Asia/Shanghai \
  -p 8642:8642 \
  nousresearch/hermes-agent \
  hermes gateway run
