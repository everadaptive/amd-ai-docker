FROM ubuntu:jammy

RUN apt update && DEBIAN_FRONTEND=noninteractive TZ=Etc/UTC apt install --yes --no-install-recommends curl ca-certificates python3-pip

RUN pip install --pre torch torchvision torchaudio --extra-index-url https://download.pytorch.org/whl/nightly/rocm5.7/

RUN pip install --pre --force-reinstall mlc-ai-nightly-rocm mlc-chat-nightly-rocm -f https://mlc.ai/wheels

RUN export DEBIAN_FRONTEND=noninteractive && export TZ=Etc/UTC && curl -O http://repo.radeon.com/amdgpu-install/latest/ubuntu/jammy/amdgpu-install_5.7.50700-1_all.deb &&\
    apt install --yes ./amdgpu-install_5.7.50700-1_all.deb &&\
    apt update &&\
    amdgpu-install -y --accept-eula --usecase=opencl,hip,rocm,graphics --opencl=rocr --vulkan=pro --no-32 --no-dkms
