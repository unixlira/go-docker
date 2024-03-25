FROM golang:1.22 AS builder

WORKDIR /app

COPY main.go .

RUN go mod init example.com/fullcycle-app && \
    go build -v -o /usr/local/bin/app .

FROM scratch

COPY --from=builder /usr/local/bin/app /usr/local/bin/app

CMD ["/usr/local/bin/app"]
