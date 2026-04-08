#!/bin/bash
docker run --rm -it \
  --name gemma-serve \
  --gpus all \
  --ipc=host \
  -v $HOME/models/gemma4-31b:/workspace/ \
  -p 8000:8000 \
  vllm/vllm-openai:v0.18.1-aarch64-cu130 \
  python3 -m vllm.entrypoints.openai.api_server \
    --model /workspace \
    --served-model-name gemma4 \
    --host 0.0.0.0 \
    --port 8000 \
    --dtype auto \
    --tensor-parallel-size 1 \
    --max-model-len 128000 \
    --gpu-memory-utilization 0.90 
