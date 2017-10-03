# Start from a Debian image with the latest version of Go installed
# and a workspace (GOPATH) configured at /go.
FROM golang

# Copy the local package files to the container's workspace.
#ADD /go/src/server /go/src/github.com/positivethinking1000/learn/server
ADD /go/src/github.com/positivethinking1000/learn/server /go/src/github.com/positivethinking1000/learn/server
ADD /go/src/github.com/positivethinking1000/learn/protob /go/src/github.com/positivethinking1000/learn/protob
#ADD main.go go/src/github.com/positivethinking1000/learn/server


# Build the outyet command inside the container.
# (You may fetch or manage dependencies here,
# either manually or with a tool like "godep".)
#RUN go install github.com/golang/example/outye
#RUN go get github.com/positivethinking1000/learn/protob
RUN go get -u  google.golang.org/grpc
RUN go install github.com/positivethinking1000/learn/server
#RUN go install 

# Document that the service listens on port 8080.
EXPOSE 50052
# Run the outyet command by default when the container starts.
ENTRYPOINT /go/bin/server
