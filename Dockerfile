FROM python:3.7-alpine
MAINTAINER ns

ENV PYTHONUNBUFFERED 1

#INSTALL DEPENDENCIES

COPY ./requirements.txt /requirements.txt
run pip install -r /requirements.txt

#SETU DIRECTORY STRUCTURE

RUN mkdir /app
WORKDIR /app
COPY ./app/ /app

RUN adduser -D nsorimuthu
USER nsorimuthu
