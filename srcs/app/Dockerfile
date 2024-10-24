FROM debian:latest

COPY ./app/minishell /minishell

RUN apt-get update && apt-get upgrade -y && \
    apt-get install -y \
        bash \
        libreadline-dev \
        libreadline8 \
        cmake \
        g++ \
        git \
        wget \
        libuv1-dev \
        libjson-c-dev \
        zlib1g-dev \
        libwebsockets-dev && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
    git clone https://github.com/tsl0922/ttyd.git /ttyd && \
    cd /ttyd && \
    mkdir build && cd build && \
    cmake .. && \
    make && \
    make install && \
    cd ../.. && \
    rm -rf /ttyd

EXPOSE 7681

CMD ["bash", "-c", "ttyd --writable /minishell"]
