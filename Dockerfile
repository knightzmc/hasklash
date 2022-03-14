FROM fpco/stack-build:latest AS build
WORKDIR /app
COPY . /app
RUN stack install --local-bin-path ./bin

FROM ubuntu:20.04
WORKDIR /app
COPY --from=build /app/bin/hasklash-exe ./
RUN apt update
RUN apt install -y ca-certificates
CMD ["./hasklash-exe"]
