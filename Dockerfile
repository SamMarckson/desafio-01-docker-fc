FROM golang:alpine as builder

WORKDIR /app

COPY . .

RUN go build -o /index index.go

FROM scratch

WORKDIR /

COPY --from=builder /index /index

CMD [ "/index" ]

