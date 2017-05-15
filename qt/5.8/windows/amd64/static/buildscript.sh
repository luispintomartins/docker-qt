#!/bin/bash

dpkg --add-architecture amd64
apt-get update
apt-get install -y --no-install-recommends \
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

mkdir -p /build
cd /build

git clone https://github.com/mxe/mxe.git

cd /build/mxe

# git checkout -b mxe_5_8 27facf1c6fcb7973781568dde9b0c1072e28f669

make -j$(nproc --all) \
    MXE_TARGETS='x86_64-w64-mingw32.static' \
    qtbase \
    qt5 \
    qtcharts \
    qtdatavis3d \
    qtimageformats \
    qtlocation \
    qtmultimedia \
    qtserialport \
    qtsvg \
    qttranslations \
    qtvirtualkeyboard \
    qtwinextras

update-alternatives --install /usr/bin/qmake qmake /build/mxe/usr/bin/x86_64-w64-mingw32.static-qmake-qt5 10

update-alternatives --install /usr/bin/mingw-gcc mingw-gcc /build/mxe/usr/bin/x86_64-w64-mingw32.static-gcc 10
update-alternatives --install /usr/bin/mingw-g++ mingw-g++ /build/mxe/usr/bin/x86_64-w64-mingw32.static-g++ 10
update-alternatives --install /usr/bin/mingw-windres mingw-windres /build/mxe/usr/bin/x86_64-w64-mingw32.static-windres 10

update-alternatives --install /usr/bin/x86_64-w64-mingw32.static-gcc x86_64-w64-mingw32.static-gcc /build/mxe/usr/bin/x86_64-w64-mingw32.static-gcc 10
update-alternatives --install /usr/bin/x86_64-w64-mingw32.static-g++ x86_64-w64-mingw32.static-g++ /build/mxe/usr/bin/x86_64-w64-mingw32.static-g++ 10
update-alternatives --install /usr/bin/x86_64-w64-mingw32.static-windres x86_64-w64-mingw32.static-windres /build/mxe/usr/bin/x86_64-w64-mingw32.static-windres 10

mkdir p /src
