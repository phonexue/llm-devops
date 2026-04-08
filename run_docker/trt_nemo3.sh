#!/bin/sh
docker run -it --rm --ipc host --gpus all \
  --ulimit memlock=-1 --ulimit stack=67108864 \
  -p 8000:8000 \
  -v $HOME/models/nemo3-120b:/workspace \
  nvcr.io/nvidia/tensorrt-llm/release:1.3.0rc9 \
  trtllm-serve /workspace \
    --backend pytorch \
    --host 0.0.0.0 \
    --port 8000 \
    --tp_size 1 \
    --max_batch_size 2 \
    --max_num_tokens 81960 \
    --max_seq_len 8196 \
    --served_model_name nemo3 \
    --fix_mistral_regex true \
    --free_gpu_memory_fraction 0.9
