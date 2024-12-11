FROM golang:1.20 AS builder

WORKDIR /app
COPY . .

RUN go mod download
RUN go build -o main ./cmd/main.go

FROM alpine:latest
WORKDIR /root/
COPY --from=builder /app/main .

ENTRYPOINT ["./main"]