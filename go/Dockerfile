
FROM golang:latest

WORKDIR /app


COPY pass-genearator.go .


RUN go build -o pass-genearator.go pass-genearator.go

CMD ["./pass-genearator.go"]