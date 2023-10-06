FROM pylibs-rocm57

FROM jammy-rocm57

RUN apt update && apt install -y --no-install-recommends sudo build-essential git ca-certificates python3-pip python3-venv

# Grant members of 'sudo' group passwordless privileges
# Comment out to require sudo
COPY sudo-nopasswd /etc/sudoers.d/sudo-nopasswd

# This is meant to be used as an interactive developer container
# Create user rocm-user as member of sudo group
# Append /opt/rocm/bin to the system PATH variable
RUN useradd --create-home -G sudo,video --shell /bin/bash rocm-user

ARG PYTORCH_BASE=https://download.pytorch.org/whl/nightly/rocm5.7

USER rocm-user
WORKDIR /app
COPY scripts ./scripts

RUN python3 -m venv /app/venv

COPY --from=0 /wheels /wheels

RUN --mount=type=cache,target=/home/rocm-user/.cache,uid=1000 \
    ./scripts/build-comfyui.sh

COPY scripts/entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]