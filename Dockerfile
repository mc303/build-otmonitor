FROM debian:bullseye as debian

ARG TARGETPLATFORM
ARG XARCH
ARG VERSION
ARG BSCRIPT="build-script.sh"
RUN echo "TARGETPLATFORM : $TARGETPLATFORM"

COPY $BSCRIPT /tmp/

WORKDIR /build

RUN apt update \
  && apt install -y curl git \
  && rm -rf /var/lib/apt/lists/* \
  && mkdir /data \
  && cd /build \
  && ls -lah /build \
  && ls -lah /tmp \
  && echo /tmp/$BSCRIPT \
  && cp /tmp/$BSCRIPT /build \
  && echo $TARGETPLATFORM \ 
  && bash $BSCRIPT "" $VERSION

FROM scratch as custom-exporter
COPY --from=debian /data/otmonitor .

#   && bash $BSCRIPT -x64 $VERSION $BRANCH


#x86      https://otgw.tclcode.com/download/otmonitor
#x86-64   https://otgw.tclcode.com/download/otmonitor-x64
#armhf    https://otgw.tclcode.com/download/otmonitor-ahf
#aarch64  https://otgw.tclcode.com/download/otmonitor-aarch64

