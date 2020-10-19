FROM golang

COPY . /go

RUN go run /go/example/hello.go