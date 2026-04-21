#!/bin/bash
docker run -d \
  --name qwen3.6-server \
  --gpus all \
  --ipc=host \
  --restart=unless-stopped \
  -v $HOME/models/qwen3.6-35b:/workspace \
  -p 8001:8001 \
  vllm/vllm-openai:v0.19.1-aarch64-cu130 \
    /workspace \
    --served-model-name qwen3.6 \
    --host 0.0.0.0 \
    --port 8001 \
    --dtype auto \
    --max-model-len 128000 \
    --max-num-batched-tokens 2048 \
    --max-num-seqs 8 \
    --enable-chunked-prefill \
    --enable-prefix-caching \
    --gpu-memory-utilization 0.8 \
    --trust-remote-code \
    --tensor-parallel-size 1 \
    --api-key free-key \
    --enforce-eager \
    --enable-auto-tool-choice \
    --tool-call-parser qwen3_coder \
    --reasoning-parser qwen3 
