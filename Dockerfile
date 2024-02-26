FROM golang:1.22-alpine as build

WORKDIR /app
COPY . .

RUN go build -ldflags="-w -s"

FROM alpine:latest as run

WORKDIR /app

COPY --from=build /app/linuxipsum ./run

EXPOSE 80

CMD ["./run"]
