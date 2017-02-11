FROM ubuntu:16.04

RUN dpkg --add-architecture i386
RUN apt-get update
RUN apt-get -y install \
    wget \
    tar \
    coreutils \
    bison \
    build-essential \
    flex \
    gperf \
    perl \
    python \
    ruby \
    gcc-5 \
    g++-5 \
    lib32gcc-5-dev \
    lib32stdc++-5-dev \
    libc6-dev:i386 \
    libsqlite3-dev:i386 \
    libmysqlclient-dev:i386 \
    libpq-dev:i386 \
    ibgstreamer-plugins-base0.10-dev:i386 \
    libasound2-dev:i386 \
    libatkmm-1.6-dev:i386 \
    libbz2-dev:i386 \
    libcap-dev:i386 \
    libcups2-dev:i386 \
    libdrm-dev:i386 \
    libegl1-mesa-dev:i386 \
    libfontconfig1-dev:i386 \
    libfreetype6-dev:i386 \
    libgcrypt20-dev:i386 \
    libglu1-mesa-dev:i386 \
    libgstreamer0.10-dev:i386 \
    libicu-dev:i386 \
    libnss3-dev:i386 \
    libpci-dev:i386 \
    libpulse-dev:i386 \
    libssl-dev:i386 \
    libudev-dev:i386 \
    libx11-dev:i386 \
    libx11-xcb-dev:i386 \
    libxcb-composite0:i386 \
    libxcb-composite0-dev:i386 \
    libxcb-cursor-dev:i386 \
    libxcb-cursor0:i386 \
    libxcb-damage0:i386 \
    libxcb-damage0-dev:i386 \
    libxcb-dpms0:i386 \
    libxcb-dpms0-dev:i386 \
    libxcb-dri2-0:i386 \
    libxcb-dri2-0-dev:i386 \
    libxcb-dri3-0:i386 \
    libxcb-dri3-dev:i386 \
    libxcb-ewmh-dev:i386 \
    libxcb-ewmh2:i386 \
    libxcb-glx0:i386 \
    libxcb-glx0-dev:i386 \
    libxcb-icccm4:i386 \
    libxcb-icccm4-dev:i386 \
    libxcb-image0:i386 \
    libxcb-image0-dev:i386 \
    libxcb-keysyms1:i386 \
    libxcb-keysyms1-dev:i386 \
    libxcb-present-dev:i386 \
    libxcb-present0:i386 \
    libxcb-randr0:i386 \
    libxcb-randr0-dev:i386 \
    libxcb-record0:i386 \
    libxcb-record0-dev:i386 \
    libxcb-render-util0:i386 \
    libxcb-render-util0-dev:i386 \
    libxcb-render0:i386 \
    libxcb-render0-dev:i386 \
    libxcb-res0:i386 \
    libxcb-res0-dev:i386 \
    libxcb-screensaver0:i386 \
    libxcb-screensaver0-dev:i386 \
    libxcb-shape0:i386 \
    libxcb-shape0-dev:i386 \
    libxcb-shm0:i386 \
    libxcb-shm0-dev:i386 \
    libxcb-sync-dev:i386 \
    libxcb-sync0-dev:i386 \
    libxcb-sync1:i386 \
    libxcb-util-dev:i386 \
    libxcb-util0-dev:i386 \
    libxcb-util1:i386 \
    libxcb-xevie0:i386 \
    libxcb-xevie0-dev:i386 \
    libxcb-xf86dri0:i386 \
    libxcb-xf86dri0-dev:i386 \
    libxcb-xfixes0:i386 \
    libxcb-xfixes0-dev:i386 \
    libxcb-xinerama0:i386 \
    libxcb-xinerama0-dev:i386 \
    libxcb-xkb-dev:i386 \
    libxcb-xkb1:i386 \
    libxcb-xprint0:i386 \
    libxcb-xprint0-dev:i386 \
    libxcb-xtest0:i386 \
    libxcb-xtest0-dev:i386 \
    libxcb-xv0:i386 \
    libxcb-xv0-dev:i386 \
    libxcb-xvmc0:i386 \
    libxcb-xvmc0-dev:i386 \
    libxcb1:i386 \
    libxcb1-dev:i386 \
    libxcomposite-dev:i386 \
    libxcursor-dev:i386 \
    libxdamage-dev:i386 \
    libxext-dev:i386 \
    libxfixes-dev:i386 \
    libxi-dev:i386 \
    libxrandr-dev:i386 \
    libxrender-dev:i386 \
    libxslt-dev:i386 \
    libxss-dev:i386 \
    libxtst-dev:i386 \
    libexpat1-dev:i386 \
    libevdev-dev:i386 \
    libxkbcommon-dev:i386 \
    libxkbcommon-x11-dev:i386

RUN update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-5 10
RUN update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-5 10

RUN mkdir /build

WORKDIR /build

RUN wget -q http://dbus.freedesktop.org/releases/dbus/dbus-1.10.14.tar.gz
RUN tar -zxf dbus-1.10.14.tar.gz

WORKDIR /build/dbus-1.10.14

RUN ./configure \
    --build=i686-pc-linux-gnu \
    "CFLAGS=-m32" \
    "CXXFLAGS=-m32" \
    "LDFLAGS=-m32"

RUN make -k -j$(nproc --all)
RUN make install

WORKDIR /build

RUN wget -q http://www.zlib.net/zlib-1.2.11.tar.gz
RUN tar -zxf zlib-1.2.11.tar.gz

WORKDIR /build/zlib-1.2.11

RUN CFLAGS=-m32 \
    ./configure
    
RUN make -k -j$(nproc --all)
RUN make install

WORKDIR /build

RUN wget -q https://openssl.org/source/openssl-1.0.2k.tar.gz
RUN tar -zxf openssl-1.0.2k.tar.gz

WORKDIR /build/openssl-1.0.2k

RUN setarch i386 \
    ./config \
    -m32 \
    no-shared \
    zlib \
    --with-zlib-include=/build/zlib-1.2.11/include \
    --with-zlib-lib=/build/zlib-1.2.11/ \
    -lz

RUN make -k -j$(nproc --all)
RUN make install

WORKDIR /build

RUN wget -q http://download.qt.io/archive/qt/5.8/5.8.0/single/qt-everywhere-opensource-src-5.8.0.tar.gz
RUN tar -zxf qt-everywhere-opensource-src-5.8.0.tar.gz

WORKDIR /build/qt-everywhere-opensource-src-5.8.0

RUN sed -i -E -e 's|(QMAKE\_LFLAGS.*)|\1 -ldl|g' /build/qt-everywhere-opensource-src-5.8.0/qtbase/mkspecs/linux-g++-32/qmake.conf

RUN PKG_CONFIG_PATH="$PKG_CONFIG_PATH:/usr/local/ssl/lib/pkgconfig:/usr/local/lib/pkgconfig" \
    ./configure \
    -v \
    -release \
    -platform linux-g++-32 \
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
    -no-compile-examples \
    -no-libproxy \
    -no-icu \
    -no-gif \
    -no-journald \
    -no-glib \
    -no-cups \
    -no-iconv \
    -no-tslib \
    -no-kms \
    \
    -qt-xcb \
    -qt-xkbcommon-x11 \
    -qt-zlib \
    -qt-libpng \
    -qt-libjpeg \
    -qt-freetype \
    -qt-harfbuzz \
    -qt-pcre \
    \
    -sql-mysql \
    -sql-psql \
    -sqlite \
    \
    -dbus-linked \
    \
    -openssl-linked

RUN make -k -j$(nproc --all)
RUN make -k install

RUN update-alternatives --install /usr/bin/qmake qmake /usr/local/Qt-5.8.0/bin/qmake 10

RUN rm -rf /build

RUN mkdir /src