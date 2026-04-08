#!/bin/bash
docker run --rm -d \
    -p 8080:8080 \
    --add-host=vllm-server:host-gateway \
    --add-host=gemma4-server:host-gateway \
    --add-host=searxng:host-gateway \
    -v open-webui-data:/app/backend/data \
    --name open-webui \
    -e ENABLE_OLLAMA_API=false \
    -e OPENAI_API_BASE_URL=http://gemma4-server:8000/v1 \
    -e OPENAI_API_KEY=free-key \
    -e WEBUI_SECRET_KEY=wusk-1234 \
    ghcr.io/open-webui/open-webui:main
