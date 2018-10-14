FROM rustdocker/rust:nightly

RUN apt-get update && apt-get install -y \
    git libasound2-dev libx11-xcb-dev libssl-dev cmake libfreetype6-dev libexpat1-dev libxcb1-dev \
    python3 build-essential libsdl2-dev

WORKDIR /amethyst
RUN git clone https://github.com/amethyst/amethyst.git .

ENV PATH="${PATH}:/root/.cargo/bin"
RUN cargo test --all --features profiler,sdl_controller --no-run
RUN cp -r target /amethyst-target
RUN rm -rf /amethyst/*
