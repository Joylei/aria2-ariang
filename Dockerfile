FROM alpine:latest

MAINTAINER wowin <leingliu@126.com>

RUN apk update \
	&& apk add --no-cache --update aria2 darkhttpd \
	&& mkdir -p aria2/conf aria2/conf-temp aria2/downloads aria-ng \
	&& wget --no-check-certificate https://github.com/mayswind/AriaNg/releases/download/1.1.5/AriaNg-1.1.5.zip \
	&& unzip AriaNg-1.1.5.zip -d aria-ng \
	&& rm -rf AriaNg-1.1.5.zip

COPY init.sh /aria2/init.sh
COPY conf-temp /aria2/conf-temp

WORKDIR /
VOLUME ["/aria2/conf", "/aria2/downloads"]
EXPOSE 6800 80 8080
EXPOSE 6881-6999

CMD ["/aria2/init.sh"]
