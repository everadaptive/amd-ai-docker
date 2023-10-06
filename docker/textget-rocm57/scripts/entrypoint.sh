#!/bin/bash

. /app/venv/bin/activate
cd /app/text-generation-webui/

python3 server.py --listen $@