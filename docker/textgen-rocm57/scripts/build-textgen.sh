#!/bin/bash
set -x
set -e 

. /app/venv/bin/activate

git clone https://github.com/oobabooga/text-generation-webui.git
cd text-generation-webui

pip install torch torchvision torchtext torchaudio torchdata triton pytorch-triton pytorch-triton-rocm --index-url https://download.pytorch.org/whl/nightly/rocm5.7
pip install /wheels/bitsandbytes/bitsandbytes-0.41.1-py3-none-any.whl /wheels/auto-gptq/auto_gptq-0.5.0.dev0-py3-none-any.whl
pip install triton-nightly --index-url https://aiinfra.pkgs.visualstudio.com/PublicPackages/_packaging/Triton-Nightly/pypi/simple/

pip install -r requirements_nowheels.txt