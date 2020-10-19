FROM golang

COPY . /
RUN go run example/hello.go