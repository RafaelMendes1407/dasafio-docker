FROM golang:1.17-alpine3.15 AS gostage

WORKDIR /go/src/app

RUN apk add --no-cache --update git
COPY . .
RUN cd src && go build -o ../bin/hello



##

FROM scratch
WORKDIR /go/src/app
COPY --from=gostage /go/src/app/bin .
CMD [ "./hello" ]