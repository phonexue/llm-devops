docker run -it --rm \
  --name comfyui-cu130 \
  --pull=always \
  --runtime=nvidia \
  --gpus all \
  -p 8188:8188 \
  -v $COMFYUI_HOME/storage-cache/dot-cache:/root/.cache \
  -v "$(COMFYUI_HOME)"/storage-cache/dot-config:/root/.config \
  -v "$(COMFYUI_HOME)"/storage-nodes/dot-local:/root/.local \
  -v "$(COMFYUI_HOME)"/storage-nodes/custom_nodes:/root/ComfyUI/custom_nodes \
  -v "$(COMFYUI_HOME)"/storage-models/models:/root/ComfyUI/models \
  -v "$(COMFYUI_HOME)"/storage-models/hf-hub:/root/.cache/huggingface/hub \
  -v "$(COMFYUI_HOME)"/storage-models/torch-hub:/root/.cache/torch/hub \
  -v "$(COMFYUI_HOME)"/storage-user/input:/root/ComfyUI/input \
  -v "$(COMFYUI_HOME)"/storage-user/output:/root/ComfyUI/output \
  -v "$(COMFYUI_HOME)"/storage-user/user-profile:/root/ComfyUI/user \
  -v "$(COMFYUI_HOME)"/storage-user/user-scripts:/root/user-scripts \
  -e CLI_ARGS="" \
  -e COMFYUI_HOME="$HOME/ComfyUI"
  yanwk/comfyui-boot:cu130-slim-v2

