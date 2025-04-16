FROM alpine AS builder

RUN apk add cmake openssl openssl-dev openssl-libs-static linux-headers ninja-is-really-ninja alpine-sdk runuser sudo sed libnl3-static libnl3-dev

COPY . /src

RUN cmake -S /src -B /build -DCMAKE_BUILD_TYPE=RELEASE -DSTATIC_BINARY=true && cmake --build /build

FROM alpine

EXPOSE 8080/tcp

COPY --from=builder /build/dpitunnel /usr/bin/dpitunnel

ENTRYPOINT ["/usr/bin/dpitunnel"]
