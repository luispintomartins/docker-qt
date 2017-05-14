#!/bin/bash

GCC_CFLAGS="-m64"
GCC_CPPFLAGS="-m64"
GCC_LDFLAGS="-m64"
GCC_HOST="x86_64-pc-linux-gnu"
GCC_BUILD="x86_64-pc-linux-gnu"
GCC_TARGET="x86_64-pc-linux-gnu"
TARGET_ARCH="amd64"
TARGET_ARCH_HOST="x86_64-linux-gnu"
TARGET_PREFIX="/usr/local"

dpkg --add-architecture $TARGET_ARCH

apt-get update

apt-get -y install --no-install-recommends \
    \
    tar \
    git \
    wget \
    flex \
    gperf \
    bison \
    coreutils \
    subversion \
    dh-autoreconf \
    \
    perl \
    ruby \
    python \
    \
    build-essential \
    \
    gcc-5 \
    g++-5 \
    \
    libgcc-5-dev:$TARGET_ARCH \
    libstdc++-5-dev:$TARGET_ARCH \
    libc6-dev:$TARGET_ARCH \
    \
    libxcb-composite0:$TARGET_ARCH \
    libxcb-composite0-dev:$TARGET_ARCH \
    libxcb-cursor-dev:$TARGET_ARCH \
    libxcb-cursor0:$TARGET_ARCH \
    libxcb-damage0:$TARGET_ARCH \
    libxcb-damage0-dev:$TARGET_ARCH \
    libxcb-dpms0:$TARGET_ARCH \
    libxcb-dpms0-dev:$TARGET_ARCH \
    libxcb-dri2-0:$TARGET_ARCH \
    libxcb-dri2-0-dev:$TARGET_ARCH \
    libxcb-dri3-0:$TARGET_ARCH \
    libxcb-dri3-dev:$TARGET_ARCH \
    libxcb-ewmh-dev:$TARGET_ARCH \
    libxcb-ewmh2:$TARGET_ARCH \
    libxcb-glx0:$TARGET_ARCH \
    libxcb-glx0-dev:$TARGET_ARCH \
    libxcb-present-dev:$TARGET_ARCH \
    libxcb-present0:$TARGET_ARCH \
    libxcb-record0:$TARGET_ARCH \
    libxcb-record0-dev:$TARGET_ARCH \
    libxcb-render-util0:$TARGET_ARCH \
    libxcb-render-util0-dev:$TARGET_ARCH \
    libxcb-render0:$TARGET_ARCH \
    libxcb-render0-dev:$TARGET_ARCH \
    libxcb-res0:$TARGET_ARCH \
    libxcb-res0-dev:$TARGET_ARCH \
    libxcb-screensaver0:$TARGET_ARCH \
    libxcb-screensaver0-dev:$TARGET_ARCH \
    libxcb-sync-dev:$TARGET_ARCH \
    libxcb-sync0-dev:$TARGET_ARCH \
    libxcb-sync1:$TARGET_ARCH \
    libxcb-util-dev:$TARGET_ARCH \
    libxcb-util0-dev:$TARGET_ARCH \
    libxcb-util1:$TARGET_ARCH \
    libxcb-xevie0:$TARGET_ARCH \
    libxcb-xevie0-dev:$TARGET_ARCH \
    libxcb-xf86dri0:$TARGET_ARCH \
    libxcb-xf86dri0-dev:$TARGET_ARCH \
    libxcb-xprint0:$TARGET_ARCH \
    libxcb-xprint0-dev:$TARGET_ARCH \
    libxcb-xtest0:$TARGET_ARCH \
    libxcb-xtest0-dev:$TARGET_ARCH \
    libxcb-xv0:$TARGET_ARCH \
    libxcb-xv0-dev:$TARGET_ARCH \
    libxcb-xvmc0:$TARGET_ARCH \
    libxcb-xvmc0-dev:$TARGET_ARCH \
    libxcb1:$TARGET_ARCH \
    libxcb1-dev:$TARGET_ARCH \
    \
    libx11-dev:$TARGET_ARCH \
    libx11-xcb-dev:$TARGET_ARCH \
    \
    libxcomposite-dev:$TARGET_ARCH \
    libxcursor-dev:$TARGET_ARCH \
    libxdamage-dev:$TARGET_ARCH \
    libxext-dev:$TARGET_ARCH \
    libxfixes-dev:$TARGET_ARCH \
    libxi-dev:$TARGET_ARCH \
    libxrandr-dev:$TARGET_ARCH \
    libxrender-dev:$TARGET_ARCH \
    libxslt-dev:$TARGET_ARCH \
    libxss-dev:$TARGET_ARCH \
    libxtst-dev:$TARGET_ARCH \
    \
    libxkbcommon-dev:$TARGET_ARCH \
    libxkbcommon-x11-dev:$TARGET_ARCH \
    \
    libfontconfig1-dev:$TARGET_ARCH \
    libfreetype6-dev:$TARGET_ARCH \
    \
    libegl1-mesa-dev:$TARGET_ARCH \
    libglu1-mesa-dev:$TARGET_ARCH \
    \
    libudev-dev:$TARGET_ARCH \
    libevdev-dev:$TARGET_ARCH \
    \
    libssl-dev:$TARGET_ARCH

update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-5 10
update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-5 10

mkdir -p /build

# +++++++++++++++++++++++++++++++++++++++++++
# + QT
# +++++++++++++++++++++++++++++++++++++++++++

cd /build

wget -q http://download.qt.io/archive/qt/5.8/5.8.0/single/qt-everywhere-opensource-src-5.8.0.tar.gz
tar -zxf qt-everywhere-opensource-src-5.8.0.tar.gz

cd /build/qt-everywhere-opensource-src-5.8.0

PKG_CONFIG="/usr/bin/pkg-config" \
PKG_CONFIG_PATH=""$TARGET_PREFIX"/ssl/lib/pkgconfig/:"$TARGET_PREFIX"/lib/pkgconfig/:/usr/lib/"$TARGET_ARCH_HOST"/pkgconfig/" \
PKG_CONFIG_LIBDIR=""$TARGET_PREFIX"/ssl/lib/:"$TARGET_PREFIX"/lib/" \
PKG_CONFIG_SYSROOT_DIR="/" \
    ./configure \
    -v \
    -shared \
    -release \
    -platform linux-g++-64 \
    -c++std c++11 \
    -opensource \
    -confirm-license \
    -force-pkg-config \
    \
    -skip qt3d \
    -skip qtactiveqt \
    -skip qtcanvas3d \
    -skip qtconnectivity \
    -skip qtdeclarative \
    -skip qtgamepad \
    -skip qtgraphicaleffects \
    -skip qtpurchasing \
    -skip qtquickcontrols \
    -skip qtquickcontrols2 \
    -skip qtscript \
    -skip qtscxml \
    -skip qtsensors \
    -skip qtserialbus \
    -skip qttools \
    -skip qtwayland \
    -skip qtwebchannel \
    -skip qtwebkit \
    -skip qtwebsockets \
    -skip qtwebview \
    -skip qtxmlpatterns \
    -skip qtwinextras \
    \
    -nomake examples \
    -nomake tests \
    \
    -no-use-gold-linker \
    -no-compile-examples \
    -no-libproxy \
    -no-icu \
    -no-gif \
    -no-journald \
    -no-glib \
    -no-cups \
    -no-iconv \
    -no-tslib \
    \
    -qt-xcb \
    -qt-xkbcommon-x11 \
    -qt-pcre \
    -qt-libjpeg \
    -qt-libpng \
    -qt-harfbuzz \
    -fontconfig \
    \
    -qt-sqlite \
    -no-sql-mysql \
    -no-sql-psql \
    \
    -openssl-runtime \
    \
    -no-dbus

make -j$(nproc --all)
make install

update-alternatives --install /usr/bin/qmake qmake $TARGET_PREFIX/Qt-5.8.0/bin/qmake 10

rm -rf /build

mkdir /src