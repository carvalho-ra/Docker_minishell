FROM debian:latest

RUN apt-get update && apt-get upgrade -y && \
    apt-get install -y bash libreadline-dev libreadline8 python3 python3-pip python3.11-venv && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Criar um ambiente virtual e instalar Flask e Gunicorn
RUN python3 -m venv /opt/venv
RUN /opt/venv/bin/pip install --upgrade pip && \
    /opt/venv/bin/pip install flask-socketio gunicorn eventlet

# Copiar os arquivos necessários para o container
COPY ./requirements/app/minishell /minishell
COPY ./requirements/app/entrypoint.sh /entrypoint.sh
COPY ./requirements/app/app.py /app.py
COPY ./requirements/app/templates /templates

# Garantir que os scripts tenham permissões de execução
RUN chmod +x /minishell /entrypoint.sh

EXPOSE 5000

# Alterar o CMD para usar Gunicorn com eventlet
CMD ["/opt/venv/bin/gunicorn", "-k", "eventlet", "-w", "1", "--bind", "0.0.0.0:5000", "app:app"]
