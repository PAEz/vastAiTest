#!/bin/bash

# Update the system
apt update -y
apt upgrade -y

# Install Python and venv
apt-get install python3.11 -y
apt install python3.10-venv -y

# Set up virtual environment

cd /workspace
git clone https://github.com/comfyanonymous/ComfyUI
cd /workspace/ComfyUI

echo "Activate download.sh now."

python3 -m venv venv
source venv/bin/activate

# Install System-wide Dependencies

apt-get install ffmpeg -y
apt-get install -y libgl1-mesa-glx

# Install Python Libraries in Virtual Environment (**Pytorch 2.1 is not yet compatible so use 2.0.1)
pip install torch==2.0.1+cu118 torchvision==0.15.2+cu118 torchaudio==2.0.2 --index-url https://download.pytorch.org/whl/cu118

pip install xformers==0.0.20

pip install opencv-python

pip install safetensors

pip install trampoline

pip install -r requirements.txt --no-deps

# Explicitly install dependencies for other packages, skipping torch, torchvision, and torchaudio
pip install einops transformers>=4.25.1 safetensors>=0.3.0 aiohttp accelerate pyyaml Pillow scipy tqdm psutil


#
# Download Section
#


# Create and setup start.sh script

echo -e '#!/bin/bash\n\nsleep 10\napt update\napt install psmisc\nfuser -k 3000/tcp\ncd /workspace/ComfyUI/venv\nsource bin/activate\ncd /workspace/ComfyUI\npython main.py --listen 0.0.0.0 --port 3000' > /start.sh

chmod +x /start.sh

# Create and setup start.sh script

echo -e '#!/bin/bash\n\nsleep 10\napt update\napt install psmisc\nfuser -k 3000/tcp\ncd /workspace/ComfyUI/venv\nsource bin/activate\ncd /workspace/ComfyUI\npython main.py --listen 0.0.0.0 --port 3000' > /start.sh

chmod +x /start.sh
























