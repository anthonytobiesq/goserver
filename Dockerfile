# ---- Build stage ----
FROM golang:1.25 AS build
WORKDIR /app

COPY go.mod ./
COPY go.sum* ./
RUN go mod download

COPY . .
RUN CGO_ENABLED=0 go build -o goserver

# ---- Runtime stage ----
FROM debian:stable-slim
COPY --from=build /app/goserver /bin/goserver
ENV PORT=8991
CMD ["/bin/goserver"]