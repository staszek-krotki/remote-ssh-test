
FROM python:3.8-slim-buster

WORKDIR /app

ENV STARTIP 23999

COPY . .


RUN apt update && apt upgrade -y
RUN apt install -y openssh-client net-tools dnsutils

RUN pip install -U Flask flask_accept

CMD [ "./run.sh" ]

EXPOSE 7861
