# Build stage
FROM golang:1.22 AS builder
WORKDIR /app

COPY go.mod go.sum ./
RUN go mod download

COPY . .
RUN CGO_ENABLED=0 GOOS=linux go build -o service .

# Run stage
FROM alpine:3.19
WORKDIR /app

COPY --from=builder /app/service .

EXPOSE 8080

CMD ["./service"]
