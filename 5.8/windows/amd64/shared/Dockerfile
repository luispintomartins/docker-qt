FROM ubuntu:16.04

RUN dpkg --add-architecture amd64
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

RUN make MXE_TARGETS='x86_64-w64-mingw32.shared' qtbase
RUN make MXE_TARGETS='x86_64-w64-mingw32.shared' qt5
RUN make MXE_TARGETS='x86_64-w64-mingw32.shared' qtcharts
RUN make MXE_TARGETS='x86_64-w64-mingw32.shared' qtdatavis3d
RUN make MXE_TARGETS='x86_64-w64-mingw32.shared' qtimageformats
RUN make MXE_TARGETS='x86_64-w64-mingw32.shared' qtlocation
RUN make MXE_TARGETS='x86_64-w64-mingw32.shared' qtmultimedia 
RUN make MXE_TARGETS='x86_64-w64-mingw32.shared' qtserialport
RUN make MXE_TARGETS='x86_64-w64-mingw32.shared' qtsvg
RUN make MXE_TARGETS='x86_64-w64-mingw32.shared' qttranslations
RUN make MXE_TARGETS='x86_64-w64-mingw32.shared' qtvirtualkeyboard
RUN make MXE_TARGETS='x86_64-w64-mingw32.shared' qtwinextras

RUN update-alternatives --install /usr/bin/qmake qmake /build/mxe/usr/bin/x86_64-w64-mingw32.shared-qmake-qt5 10

RUN update-alternatives --install /usr/bin/mingw-gcc mingw-gcc /build/mxe/usr/bin/x86_64-w64-mingw32.shared-gcc 10
RUN update-alternatives --install /usr/bin/mingw-g++ mingw-g++ /build/mxe/usr/bin/x86_64-w64-mingw32.shared-g++ 10
RUN update-alternatives --install /usr/bin/mingw-windres mingw-windres /build/mxe/usr/bin/x86_64-w64-mingw32.shared-windres 10

RUN update-alternatives --install /usr/bin/x86_64-w64-mingw32.shared-gcc x86_64-w64-mingw32.shared-gcc /build/mxe/usr/bin/x86_64-w64-mingw32.shared-gcc 10
RUN update-alternatives --install /usr/bin/x86_64-w64-mingw32.shared-g++ x86_64-w64-mingw32.shared-g++ /build/mxe/usr/bin/x86_64-w64-mingw32.shared-g++ 10
RUN update-alternatives --install /usr/bin/x86_64-w64-mingw32.shared-windres x86_64-w64-mingw32.shared-windres /build/mxe/usr/bin/x86_64-w64-mingw32.shared-windres 10

RUN mkdir /src