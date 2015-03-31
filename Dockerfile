FROM debian:jessie
MAINTAINER Jan Suchotzki <jan@inginform.de>

# Installiere die benötigten Anwendungen & Bibliotheken zur C-Entwicklung
RUN apt-get update && apt-get install -y --no-install-recommends \
		curl \
		git \
		gcc \
		libc6-dev \
		make \
		nano \
	&& rm -rf /var/lib/apt/lists/*
