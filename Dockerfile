FROM fpco/stack-build:latest AS build
WORKDIR /app
COPY . /app
RUN stack build

FROM ubuntu:20.04
WORKDIR /app
COPY --from=build /app/hasklash-exe ./
CMD ["./hasklash-exe"]
