FROM elixir:alpine

RUN mix local.hex --force
RUN mix local.rebar --force

WORKDIR /app
COPY . .

RUN mix do deps.get, deps.compile
RUN mix compile

CMD mix run --no-halt
