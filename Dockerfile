FROM debian:stable

RUN apt-get update
RUN apt-get -y install nasm gcc gdb make

RUN adduser nasm
WORKDIR /home/nasm
USER nasm

COPY --chown=nasm:nasm . .

ENTRYPOINT [ "bash" ]
