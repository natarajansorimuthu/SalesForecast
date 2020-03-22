FROM python:3.7-alpine
MAINTAINER ns

ENV PYTHONUNBUFFERED 1

#INSTALL DEPENDENCIES

COPY ./requirements.txt /requirements.txt
RUN apk add --update --no-cache postgresql-client
RUN apk add --update --no-cache --virtual .tmp-build-deps \
      gcc libc-dev linux-headers postgresql-dev
run pip install -r /requirements.txt

#SETU DIRECTORY STRUCTURE

RUN mkdir /app
WORKDIR /app
COPY ./app/ /app

RUN adduser -D nsorimuthu
USER nsorimuthu
