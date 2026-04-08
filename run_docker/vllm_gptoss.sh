#!/bin/bash
docker run --rm -d \
  --name gptoss-serve \
  --gpus all \
  --ipc=host \
  -v $HOME/models/gptoss-120b:/workspace/model \
  -p 8000:8000 \
  nvcr.io/nvidia/vllm:26.02-py3 \
  python3 -m vllm.entrypoints.openai.api_server \
    --model /workspace/model \
    --served-model-name gptoss \
    --host 0.0.0.0 \
    --port 8000 \
    --dtype auto \
    --tensor-parallel-size 1 \
    --max-model-len 128000 \
    --gpu-memory-utilization 0.90 
