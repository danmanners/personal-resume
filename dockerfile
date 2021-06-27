# Set up Hugo in Alpine to build the source
ARG HUGODIR="/opt/danmanners-dot-com"

FROM alpine:3.12 as hugo_build
ARG HUGODIR
RUN apk add hugo --no-cache \
    && mkdir -p ${HUGODIR}

COPY content ${HUGODIR}/content
COPY static ${HUGODIR}/static
COPY themes ${HUGODIR}/themes
COPY config.toml ${HUGODIR}/config.toml

WORKDIR ${HUGODIR}
RUN hugo --minify

FROM nginx:1.19.3-alpine
LABEL MAINTAINER="Dan Manners (daniel.a.manners@gmail.com)"

ARG HUGODIR
COPY --from=hugo_build ${HUGODIR}/public /usr/share/nginx/html

RUN sed -i 's/#ZgotmplZ/tel:19147155428/g' /usr/share/nginx/html/index.html
