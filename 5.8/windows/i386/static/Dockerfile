FROM ubuntu:16.04

RUN dpkg --add-architecture i386
RUN apt-get update
RUN apt-get install -y --no-install-recommends \
    autoconf \
    automake \
    autopoint \
    binutils \
    bison \
    build-essential \
    ca-certificates \
    cmake \
    debhelper \
    devscripts \
    fakeroot \
    flex \
    gcc \
    git \
    gperf \
    intltool \
    libgdk-pixbuf2.0-dev \
    libffi-dev \
    libgmp-dev \
    libmpc-dev \
    libmpfr-dev \
    libtool \
    libtool-bin \
    libz-dev \
    openssl \
    patch \
    pkg-config \
    p7zip-full \
    ruby \
    scons \
    subversion \
    texinfo \
    unzip \
    wget

RUN mkdir /build
WORKDIR  /build

RUN git clone https://github.com/mxe/mxe.git

WORKDIR  ./mxe

RUN git checkout -b mxe_5_8 27facf1c6fcb7973781568dde9b0c1072e28f669

RUN make MXE_TARGETS='i386-w64-mingw32.static' qtbase
RUN make MXE_TARGETS='i386-w64-mingw32.static' qtserialport
RUN make MXE_TARGETS='i386-w64-mingw32.static' qtmultimedia 
RUN make MXE_TARGETS='i386-w64-mingw32.static' qtwinextras

RUN ln -s /build/mxe/usr/bin/i386-w64-mingw32.static-qmake-qt5 /usr/bin/qmake
RUN ln -s /build/mxe/usr/bin/i386-w64-mingw32.static-gcc /usr/bin/i386-w64-mingw32.static-gcc
RUN ln -s /build/mxe/usr/bin/i386-w64-mingw32.static-g++ /usr/bin/i386-w64-mingw32.static-g++
RUN ln -s /build/mxe/usr/bin/i386-w64-mingw32.static-windres /usr/bin/i386-w64-mingw32.static-windres

RUN ln -s /build/mxe/usr/bin/i386-w64-mingw32.static-gcc /usr/bin/mingw-gcc
RUN ln -s /build/mxe/usr/bin/i386-w64-mingw32.static-g++ /usr/bin/mingw-g++
RUN ln -s /build/mxe/usr/bin/i386-w64-mingw32.static-windres /usr/bin/mingw-windres

RUN mkdir /src