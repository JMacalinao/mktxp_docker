FROM python:3.8-slim-buster
MAINTAINER Guenter Bailey

RUN apt-get update && \
	apt-get install -y git nano && \
	rm -rf /var/lib/apt/lists/* && \
	pip install git+https://github.com/akpw/mktxp && \
	mkdir -p /root/mktxp

COPY config/_mktxp.conf /root/mktxp/_mktxp.conf
COPY config/mktxp.conf /root/mktxp/mktxp.conf

EXPOSE 49090
CMD ["mktxp", "export"]
