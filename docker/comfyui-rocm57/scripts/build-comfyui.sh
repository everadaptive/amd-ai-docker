#!/bin/bash
set -x
set -e 

. /app/venv/bin/activate

git clone https://github.com/comfyanonymous/ComfyUI.git comfyui
cd comfyui

pip install torch torchvision torchtext torchaudio torchdata triton pytorch-triton pytorch-triton-rocm --index-url https://download.pytorch.org/whl/nightly/rocm5.7

pip install -r requirements.txt