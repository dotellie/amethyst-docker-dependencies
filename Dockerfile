FROM rust:latest
ARG CHANNEL

RUN apt-get update && apt-get install -y \
    git libasound2-dev libx11-xcb-dev libssl-dev cmake libfreetype6-dev libexpat1-dev libxcb1-dev \
    python3 build-essential libsdl2-dev

RUN rustup toolchain install $CHANNEL
RUN rustup default  $CHANNEL

WORKDIR /amethyst
RUN git clone https://github.com/amethyst/amethyst.git .

RUN cargo test --all --features profiler,sdl_controller --no-run
RUN mv target /amethyst-target
RUN rm -rf /amethyst/*
