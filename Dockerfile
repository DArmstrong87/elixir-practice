# Dockerfile for Elixir app
FROM elixir:1.16.1-alpine

# Install Hex + Rebar
RUN mix local.hex --force && \
    mix local.rebar --force

# Set working directory
WORKDIR /app

# Install build dependencies
RUN apk add --no-cache build-base git

# Copy mix files and install deps
COPY mix.exs mix.lock ./
RUN mix deps.get

# Copy the rest of the app
COPY . .

# Precompile
RUN mix compile

CMD ["mix", "phx.server"]
