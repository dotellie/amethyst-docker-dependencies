FROM rustdocker/rustup

ARG CHANNEL
ARG MDBOOK_RELEASE=0.2.1
ENV PATH=/root/.cargo/bin:$PATH

RUN apt-get update && apt-get install -y \
    git libasound2-dev libx11-xcb-dev libssl-dev cmake libfreetype6-dev libexpat1-dev libxcb1-dev \
    python3 build-essential libsdl2-dev

RUN rustup toolchain install ${CHANNEL} && \
    rustup default ${CHANNEL} && \
    rustup component add rustfmt-preview
RUN cargo install mdbook --vers ${MDBOOK_RELEASE}
