#!/bin/bash
docker run -d \
  --name gemma4-serve \
  --gpus all \
  --ipc=host \
  --restart=unless-stopped \
  -v $HOME/models/gemma4-26b:/workspace \
  -p 8000:8000 \
  vllm/vllm-openai:gemma4-cu130 \
    --model /workspace \
    --served-model-name gemma4 \
    --host 0.0.0.0 \
    --port 8000 \
    --dtype auto \
    --max-model-len 128000 \
    --max-num-batched-tokens 1024 \
    --max-num-seqs 8 \
    --enable-chunked-prefill \
    --enable-prefix-caching \
    --gpu-memory-utilization 0.45 \
    --trust-remote-code \
    --tensor-parallel-size 1 \
    --api-key free-key \
    --enforce-eager \
    --enable-auto-tool-choice \
    --tool-call-parser gemma4 \
    --reasoning-parser gemma4 

