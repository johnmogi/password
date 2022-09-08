FROM ubuntu:20.04

WORKDIR /app/
COPY . .

RUN apt-get update
RUN apt-get install -y  

CMD ["/bin/bash"]

