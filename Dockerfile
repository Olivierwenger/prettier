FROM docker.io/hadolint/hadolint:latest as hadolint

FROM alpine:3.16.3


RUN  apk update \
  && apk add --no-cache ca-certificates nodejs npm \
  && update-ca-certificates \
  && npm install -g prettier@latest \
  @prettier/plugin-php \
  @prettier/plugin-pug \
  @prettier/plugin-ruby \
  @prettier/plugin-xml \
  prettier-plugin-apex \
  prettier-plugin-erb \
  prettier-plugin-glsl \
  prettier-plugin-go-template \
  prettier-plugin-java \
  @stedi/prettier-plugin-jsonata \
  prettier-plugin-kotlin \
  prettier-plugin-properties \
  prettier-plugin-rust \
  prettier-plugin-sh \
  prettier-plugin-solidity \
  prettier-plugin-svelte \
  prettier-plugin-toml \
  && npm cache clean --force \
  && apk del npm

COPY --from=hadolint /bin/hadolint /bin/hadolint

WORKDIR /work

ENTRYPOINT ["prettier"]
CMD ["--help"]
