#!/bin/bash
docker run -d \
  --name gemma4-moe \
  --gpus all \
  --ipc=host \
  --restart=unless-stopped \
  -v $HOME/models/gemma4-26b:/workspace \
  -p 8000:8000 \
  vllm/vllm-openai:gemma4-cu130 \
    --model /workspace \
    --served-model-name gemma4-moe \
    --host 0.0.0.0 \
    --port 8000 \
    --quantization fp8 \
    --kv-cache-dtype fp8 \
    --max-model-len 32768 \
    --max-num-batched-tokens 16384 \
    --max-num-seqs 1 \
    --attention-backend flash-attn \
    --enable-chunked-prefill \
    --enable-prefix-caching \
    --gpu-memory-utilization 0.9 \
    --trust-remote-code \
    --tensor-parallel-size 1 \
    --api-key free-key \
    --enforce-eager false \
    --enforce-cuda-graph \
    --enable-auto-tool-choice \
    --tool-call-parser gemma4 \
    --reasoning-parser gemma4 

