
FROM alpine

WORKDIR /app

ENV PORT 23999

COPY . .

RUN apk update
RUN apk add curl 
RUN apk add bind-tools
RUN apk add bash


CMD [ "./run.sh" ]

