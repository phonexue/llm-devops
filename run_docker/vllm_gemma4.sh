#!/bin/bash
docker run --rm -it \
  --name gemma-serve \
  --gpus all \
  --ipc=host \
  -v $HOME/models/gemma4-31b:/workspace/ \
  -p 8000:8000 \
  vllm/vllm-openai:v0.18.1-aarch64-cu130 \
    --model /workspace \
    --served-model-name gemma4 \
    --host 0.0.0.0 \
    --port 8000 \
    --quantization fp8 \
    --dtype auto \
    --max-model-len 4096 \
    --max-num-batched-tokens 512 \
    --max-num-seqs 8 \
    --enable-chunked-prefill \
    --enable-prefix-caching \
    --gpu-memory-utilization 0.9 \
    --scheduling-policy fcfs \
    --num-scheduler-steps 1 \
    --trust-remote-code \
    --tensor-parallel-size 1 \
    --api-key free-key \
    --enforce-eager \
    --enable-auto-tool-choice \
    --tool-call-parser gemma4 \
    --enable-reasoning \
    --reasoning-parser gemma4 

