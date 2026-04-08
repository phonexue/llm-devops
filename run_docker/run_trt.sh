#!/bin/bash
docker run --rm -it --gpus all \
    --ipc=host \
    --ulimit memlock=-1 \
    --ulimit stack=67108864 \
    -p 8000:8000 \
    -v $HOME/models/Nemo3-120B-P4:/models/nemotron \
    -v $HOME/run_docker/extra_llm_api_options.yaml:/workspace/extra_llm_api_options.yaml \
    -e HF_TOKEN=$HF_TOKEN \
    nvcr.io/nvidia/tensorrt-llm/release:spark-single-gpu-dev \
    trtllm-serve /models/nemotron \
    --backend pytorch \
    --host 0.0.0.0 \
    --port 8000 \
    --extra_llm_api_options /workspace/extra_llm_api_options.yaml
