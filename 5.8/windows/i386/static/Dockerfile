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

RUN make MXE_TARGETS='i686-w64-mingw32.static' qtbase
RUN make MXE_TARGETS='i686-w64-mingw32.static' qtserialport
RUN make MXE_TARGETS='i686-w64-mingw32.static' qtmultimedia 
RUN make MXE_TARGETS='i686-w64-mingw32.static' qtwinextras

RUN update-alternatives --install /usr/bin/qmake qmake /build/mxe/usr/bin/i686-w64-mingw32.static-qmake-qt5 10

RUN update-alternatives --install /usr/bin/mingw-gcc mingw-gcc /build/mxe/usr/bin/i686-w64-mingw32.static-gcc 10
RUN update-alternatives --install /usr/bin/mingw-g++ mingw-g++ /build/mxe/usr/bin/i686-w64-mingw32.static-g++ 10
RUN update-alternatives --install /usr/bin/mingw-windres mingw-windres /build/mxe/usr/bin/i686-w64-mingw32.static-windres 10

RUN update-alternatives --install /usr/bin/i686-w64-mingw32.static-gcc i686-w64-mingw32.static-gcc /build/mxe/usr/bin/i686-w64-mingw32.static-gcc 10
RUN update-alternatives --install /usr/bin/i686-w64-mingw32.static-g++ i686-w64-mingw32.static-g++ /build/mxe/usr/bin/i686-w64-mingw32.static-g++ 10
RUN update-alternatives --install /usr/bin/i686-w64-mingw32.static-windres i686-w64-mingw32.static-windres /build/mxe/usr/bin/i686-w64-mingw32.static-windres 10

RUN mkdir /src