#!/bin/sh
docker run -d --rm --ipc host --gpus all \
  --name nemo3-120b \
  --ulimit memlock=-1 --ulimit stack=67108864 \
  -p 8000:8000 \
  -v $HOME/models/nemo3-120b:/workspace \
  nvcr.io/nvidia/tensorrt-llm/release:1.3.0rc9 \
  trtllm-serve /workspace \
    --served_model_name nemo3 \
    --host 0.0.0.0 \
    --port 8000 \
    --max_batch_size 2 \
    --max_num_tokens 32768 \
    --trust_remote_code \
    --reasoning_parser nano-v3 \
    --tool_parser qwen3_coder \
    --extra_llm_api_options /workspace/extra_config.yaml
