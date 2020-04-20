FROM alpine:latest

MAINTAINER wowin <leingliu@126.com>

ARG ariang_v=1.1.5

RUN apk update \
	&& apk add --no-cache --update aria2 darkhttpd \
	&& mkdir -p aria2/conf aria2/conf-temp aria2/downloads aria-ng \
	&& wget --no-check-certificate -O AriaNg.zip https://github.com/mayswind/AriaNg/releases/download/${ariang_v}/AriaNg-${ariang_v}.zip \
	&& unzip AriaNg.zip -d aria-ng \
	&& rm -rf AriaNg.zip

COPY init.sh /aria2/init.sh
COPY conf-temp /aria2/conf-temp

WORKDIR /
VOLUME ["/aria2/conf", "/aria2/downloads"]
EXPOSE 6800 80 8080
EXPOSE 6881-6999

CMD ["/aria2/init.sh"]
