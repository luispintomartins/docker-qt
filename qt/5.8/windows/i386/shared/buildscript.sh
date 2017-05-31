#!/bin/bash
set -e 

dpkg --add-architecture i386
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

git checkout -b mxe_5_8 5e9806e0894e8565ed7c3f9b73c03a2e37814f45

make -j$(nproc --all) \
    MXE_TARGETS='i686-w64-mingw32.shared' \
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

update-alternatives --install /usr/bin/qmake qmake /build/mxe/usr/bin/i686-w64-mingw32.shared-qmake-qt5 10

update-alternatives --install /usr/bin/mingw-gcc mingw-gcc /build/mxe/usr/bin/i686-w64-mingw32.shared-gcc 10
update-alternatives --install /usr/bin/mingw-g++ mingw-g++ /build/mxe/usr/bin/i686-w64-mingw32.shared-g++ 10
update-alternatives --install /usr/bin/mingw-windres mingw-windres /build/mxe/usr/bin/i686-w64-mingw32.shared-windres 10

update-alternatives --install /usr/bin/i686-w64-mingw32.shared-gcc i686-w64-mingw32.shared-gcc /build/mxe/usr/bin/i686-w64-mingw32.shared-gcc 10
update-alternatives --install /usr/bin/i686-w64-mingw32.shared-g++ i686-w64-mingw32.shared-g++ /build/mxe/usr/bin/i686-w64-mingw32.shared-g++ 10
update-alternatives --install /usr/bin/i686-w64-mingw32.shared-windres i686-w64-mingw32.shared-windres /build/mxe/usr/bin/i686-w64-mingw32.shared-windres 10

mkdir -p /src
