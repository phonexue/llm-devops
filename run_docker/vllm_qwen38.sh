#!/bin/bash
docker run -d --name vllm-qwen38 --restart unless-stopped \
  --gpus all --ipc=host \
  --ulimit memlock=-1 --ulimit stack=67108864 \
  -p 8000:8000 \
  -v "$HOME/models/qwen38-fp8:/workspace" \
  dgx-vllm:20261010 vllm serve /workspace \
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
    --speculative-config '{"method":"dspark","model":"RadixArk/Qwen3.8-27B-DSpark","num_speculative_tokens":7,"draft_sample_method":"probabilistic"}'
