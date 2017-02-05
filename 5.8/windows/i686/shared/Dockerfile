FROM ubuntu:16.04

RUN dpkg --add-architecture i686
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

RUN make MXE_TARGETS='i686-w64-mingw32.shared' qtbase
RUN make MXE_TARGETS='i686-w64-mingw32.shared' qtserialport
RUN make MXE_TARGETS='i686-w64-mingw32.shared' qtmultimedia 
RUN make MXE_TARGETS='i686-w64-mingw32.shared' qtwinextras

RUN ln -s /build/mxe/usr/bin/i686-w64-mingw32.shared-qmake-qt5 /usr/bin/qmake
RUN ln -s /build/mxe/usr/bin/i686-w64-mingw32.shared-gcc /usr/bin/i686-w64-mingw32.shared-gcc
RUN ln -s /build/mxe/usr/bin/i686-w64-mingw32.shared-g++ /usr/bin/i686-w64-mingw32.shared-g++
RUN ln -s /build/mxe/usr/bin/i686-w64-mingw32.shared-windres /usr/bin/i686-w64-mingw32.shared-windres

RUN ln -s /build/mxe/usr/bin/i686-w64-mingw32.shared-gcc /usr/bin/mingw-gcc
RUN ln -s /build/mxe/usr/bin/i686-w64-mingw32.shared-g++ /usr/bin/mingw-g++
RUN ln -s /build/mxe/usr/bin/i686-w64-mingw32.shared-windres /usr/bin/mingw-windres

RUN mkdir /src