FROM golang:1.20-alpine

# Set maintainer label: maintainer=[YOUR-EMAIL]
LABEL maintainer='sascha@bauercloud.at'

# Set working directory: `/src`
WORKDIR /go/src/app

# Copy local file `main.go` to the working directory
COPY . /go/src/app
#COPY go*.* /go/src/app
#COPY go.* /go/src/app

# List items in the working directory (ls)
RUN ls -l /go/src/app/
RUN go env -w GO111MODULE=off

# Build the GO app as myapp binary and move it to /usr/
RUN go build -o main.go

#Expose port 8010
EXPOSE 8010

# Run the service myapp when a container of this image is launched
CMD ["./main.go"]