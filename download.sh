#!/bin/bash
mkdir -p /workspace/ComfyUI/models/checkpoints2
cd /workspace/ComfyUI/models/checkpoints2

cd /wokspace/ComfyUI/models/loras

mkdir -p /workspace/ComfyUI/models/checkpoints2

# Create extra_model_paths.yaml
echo -e "comfyui:\n\n      checkpoints: models/checkpoints2/" > /workspace/ComfyUI/extra_model_paths.yaml

# Navigate to the custom_nodes directory
cd /workspace/ComfyUI/custom_nodes

# Clone the GitHub repositories for custom nodes
git clone https://github.com/ltdrdata/ComfyUI-Manager.git
git clone https://github.com/Kosinkadink/ComfyUI-AnimateDiff-Evolved.git
git clone https://github.com/Kosinkadink/ComfyUI-Advanced-ControlNet.git
git clone https://github.com/Kosinkadink/ComfyUI-VideoHelperSuite.git
git clone https://github.com/cubiq/ComfyUI_IPAdapter_plus.git
git clone https://github.com/aianimation55/ComfyUI-FatLabels.git

sudo apt install -y aria2

aria2c -i urls.txt --max-concurrent-downloads=3 --split=3  
























