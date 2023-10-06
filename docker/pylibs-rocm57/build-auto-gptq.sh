#!/bin/bash
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
cd $SCRIPT_DIR

TMP_ENV=$(mktemp -d -t auto-gptq-XXXX) 
python3 -m venv $TMP_ENV

source $TMP_ENV/bin/activate

pip install --upgrade build wheel

pip install torch torchvision torchtext torchaudio torchdata triton pytorch-triton pytorch-triton-rocm --index-url https://download.pytorch.org/whl/nightly/rocm5.7

if [[ ! -d "data/auto-gptq" ]]; then
    git clone https://github.com/PanQiWei/AutoGPTQ data/auto-gptq
fi

cd data/auto-gptq

export ROCM_VERSION=5.7 
export CC=/opt/rocm/llvm/bin/clang 
export CXX=/opt/rocm/llvm/bin/clang++ 
export CMAKE_PREFIX_PATH=/opt/rocm 
export CT_HIPBLAS=1 
export BUILD_CUDA_EXT=0

python3 -m build --no-isolation

deactivate