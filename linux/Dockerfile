FROM rust:latest
ARG CHANNEL
ARG MDBOOK_RELEASE=0.2.1
ENV CARGO_TARGET_DIR=/amethyst-target

RUN apt-get update && apt-get install -y \
    git libasound2-dev libx11-xcb-dev libssl-dev cmake libfreetype6-dev libexpat1-dev libxcb1-dev \
    python3 build-essential libsdl2-dev

RUN rustup toolchain install $CHANNEL
RUN rustup default  $CHANNEL

RUN cargo install mdbook --vers "$MDBOOK_RELEASE"

WORKDIR /amethyst
RUN git clone https://github.com/amethyst/amethyst.git . && \
    cargo test --all --features profiler,sdl_controller --no-run && \
    rm -rf /amethyst/*
