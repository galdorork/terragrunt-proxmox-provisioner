FROM golang

COPY . /
RUN pwd
RUN go run example/hello.go