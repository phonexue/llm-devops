#!/bin/bash
docker run --rm -dt \
  --name hermes \
  --network host \
  ubuntu:hermes-agent
