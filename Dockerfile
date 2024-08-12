FROM jac18281828/rust:latest

ARG PROJECT=rethex
WORKDIR /workspaces/${PROJECT}

RUN yamlfmt --check .github/*.yml .github/workflows/*.yml

USER rust
ENV USER=rust
ENV PATH=/home/${USER}/.cargo/bin:$PATH
# source $HOME/.cargo/env

COPY --chown=rust:rust . .

RUN cargo fmt --check
RUN cargo clippy --all-features --no-deps
RUN cargo test

