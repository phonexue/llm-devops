#!/bin/bash
docker run -d --name vllm-qwen38 --restart unless-stopped \
  --gpus all --ipc=host \
  --ulimit memlock=-1 --ulimit stack=67108864 \
  -p 8000:8000 \
  -v "$HOME/models/qwen38-fp8/" \
  dgx-vllm:20261010 \ 
  Qwen/Qwen3.8-27B-FP8 \
    --host 0.0.0.0 --port 8000 \
    --served-model-name qwen3.8-27b \
    --tensor-parallel-size 1 \
    --max-model-len 131072 \
    --gpu-memory-utilization 0.80 \
    --kv-cache-dtype fp8 \
    --max-num-seqs 8 \
    --max-num-batched-tokens 16384 \
    --enable-prefix-caching \
    --enable-chunked-prefill \
    --reasoning-parser qwen3 \
    --enable-auto-tool-choice \
    --tool-call-parser qwen3_coder
