FROM alpine:3.15.0

# concourse cli (fly)
ENV CONCOURSE_VERSION=7.6.0
RUN wget -O /tmp/fly-linux-amd64.tgz https://github.com/concourse/concourse/releases/download/v${CONCOURSE_VERSION}/fly-${CONCOURSE_VERSION}-linux-amd64.tgz \
	&& tar -xvzf /tmp/fly-linux-amd64.tgz -C /usr/bin \
	&& chmod +x /usr/bin/fly \
	&& fly --version

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
CMD []
