FROM golang

COPY example /
RUN go run example/hello.go