FROM golang:1.22-alpine AS build

WORKDIR /app
COPY . .

RUN go build -ldflags="-w -s"

FROM alpine:latest AS run

WORKDIR /app

COPY --from=build /app/linuxipsum ./linuxipsum

EXPOSE 80

CMD ["./linuxipsum"]
