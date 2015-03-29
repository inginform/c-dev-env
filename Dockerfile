FROM debian:jessie
MAINTAINER Jan Suchotzki <jan@inginform.de>

# Install git
RUN apt-get update && apt-get install -y --no-install-recommends \
		nano \
	&& rm -rf /var/lib/apt/lists/*
