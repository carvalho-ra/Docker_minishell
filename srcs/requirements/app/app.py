from flask import Flask, render_template
from flask_socketio import SocketIO, emit
import os
import subprocess

app = Flask(__name__)
socketio = SocketIO(app)

current_directory = os.getcwd()

@app.route('/')
def index():
    return render_template('index.html')

@socketio.on('execute_command')
def handle_command(command):
    global current_directory
    if command.startswith("cd"):
        path = command.split(" ")[1] if len(command.split(" ")) > 1 else None
        try:
            if path:
                os.chdir(path)
            else:
                os.chdir(os.path.expanduser('~'))
            current_directory = os.getcwd()
            emit('response', f"Diretório atual: {current_directory}")
        except Exception as e:
            emit('response', f"Erro: {str(e)}")
    else:
        try:
            result = subprocess.run(command, shell=True, cwd=current_directory, capture_output=True, text=True)
            emit('response', result.stdout + result.stderr)  # Combine stdout and stderr
        except Exception as e:
            emit('response', f"Erro ao executar o comando: {str(e)}")

if __name__ == '__main__':
    socketio.run(app, debug=True)
