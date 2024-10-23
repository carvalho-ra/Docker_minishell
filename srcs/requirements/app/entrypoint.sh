#!/bin/bash
set -e

# Ativar o ambiente virtual
source /opt/venv/bin/activate

# Iniciar o servidor
exec gunicorn -k eventlet -w 1 --bind 0.0.0.0:5000 app:app
