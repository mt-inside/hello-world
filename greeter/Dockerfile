FROM rust:1.34 as builder

WORKDIR /build
RUN cargo install cargo-build-deps
RUN USER=root cargo new --bin greeter
WORKDIR /build/greeter
COPY Cargo.toml Cargo.lock ./
RUN cargo build-deps --release
COPY src src
RUN cargo build --release


FROM gcr.io/distroless/cc

COPY --from=builder /build/greeter/target/release/greeter /

ENTRYPOINT ["/greeter"]
