FROM ubuntu:16.04

FROM python:3.6.5

RUN apt-get update -y && \
    apt-get install -y python-pip python-dev

# We copy just the requirements.txt first to leverage Docker cache
ADD ./requirements.txt /app/requirements.txt

WORKDIR /app

RUN pip install -r requirements.txt

ADD . /app

CMD python /app/model.py && python /app/server.py

 
