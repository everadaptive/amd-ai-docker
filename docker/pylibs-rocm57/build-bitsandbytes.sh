#!/bin/bash
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
cd $SCRIPT_DIR

TMP_ENV=$(mktemp -d -t bitsandbytes-XXXX) 
python3 -m venv $TMP_ENV

source $TMP_ENV/bin/activate

pip install --upgrade build wheel

if [[ ! -d "data/bitsandbytes" ]]; then
    git clone https://github.com/arlo-phoenix/bitsandbytes-rocm-5.6.git data/bitsandbytes
fi

cd data/bitsandbytes/

make hip ROCM_TARGET=gfx1100,gfx1030 ROCM_HOME=/opt/rocm-5.7.0/

python3 -m build --no-isolation

deactivate