FROM ubuntu:16.04

RUN dpkg --add-architecture amd64
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
    libgcc-5-dev:amd64 \
    lib32gcc-5-dev:amd64 \
    lib32stdc++-5-dev:amd64 \
#    libssl-dev:amd64 \
#    libcrypto++-dev:amd64 \
    libc6-dev:amd64 \
    libsqlite3-dev:amd64 \
#    libmysqlclient-dev:amd64 \
#    libpq-dev:amd64 \
    ibgstreamer-plugins-base0.10-dev:amd64 \
    libasound2-dev:amd64 \
    libatkmm-1.6-dev:amd64 \
    libbz2-dev:amd64 \
    libcap-dev:amd64 \
    libcups2-dev:amd64 \
    libdrm-dev:amd64 \
    libegl1-mesa-dev:amd64 \
    libfontconfig1-dev:amd64 \
    libfreetype6-dev:amd64 \
    libgcrypt20-dev:amd64 \
    libglu1-mesa-dev:amd64 \
    libgstreamer0.10-dev:amd64 \
    libicu-dev:amd64 \
    libnss3-dev:amd64 \
    libpci-dev:amd64 \
    libpulse-dev:amd64 \
    libudev-dev:amd64 \
    libx11-dev:amd64 \
    libx11-xcb-dev:amd64 \
    libxcb-composite0:amd64 \
    libxcb-composite0-dev:amd64 \
    libxcb-cursor-dev:amd64 \
    libxcb-cursor0:amd64 \
    libxcb-damage0:amd64 \
    libxcb-damage0-dev:amd64 \
    libxcb-dpms0:amd64 \
    libxcb-dpms0-dev:amd64 \
    libxcb-dri2-0:amd64 \
    libxcb-dri2-0-dev:amd64 \
    libxcb-dri3-0:amd64 \
    libxcb-dri3-dev:amd64 \
    libxcb-ewmh-dev:amd64 \
    libxcb-ewmh2:amd64 \
    libxcb-glx0:amd64 \
    libxcb-glx0-dev:amd64 \
    libxcb-icccm4:amd64 \
    libxcb-icccm4-dev:amd64 \
    libxcb-image0:amd64 \
    libxcb-image0-dev:amd64 \
    libxcb-keysyms1:amd64 \
    libxcb-keysyms1-dev:amd64 \
    libxcb-present-dev:amd64 \
    libxcb-present0:amd64 \
    libxcb-randr0:amd64 \
    libxcb-randr0-dev:amd64 \
    libxcb-record0:amd64 \
    libxcb-record0-dev:amd64 \
    libxcb-render-util0:amd64 \
    libxcb-render-util0-dev:amd64 \
    libxcb-render0:amd64 \
    libxcb-render0-dev:amd64 \
    libxcb-res0:amd64 \
    libxcb-res0-dev:amd64 \
    libxcb-screensaver0:amd64 \
    libxcb-screensaver0-dev:amd64 \
    libxcb-shape0:amd64 \
    libxcb-shape0-dev:amd64 \
    libxcb-shm0:amd64 \
    libxcb-shm0-dev:amd64 \
    libxcb-sync-dev:amd64 \
    libxcb-sync0-dev:amd64 \
    libxcb-sync1:amd64 \
    libxcb-util-dev:amd64 \
    libxcb-util0-dev:amd64 \
    libxcb-util1:amd64 \
    libxcb-xevie0:amd64 \
    libxcb-xevie0-dev:amd64 \
    libxcb-xf86dri0:amd64 \
    libxcb-xf86dri0-dev:amd64 \
    libxcb-xfixes0:amd64 \
    libxcb-xfixes0-dev:amd64 \
    libxcb-xinerama0:amd64 \
    libxcb-xinerama0-dev:amd64 \
    libxcb-xkb-dev:amd64 \
    libxcb-xkb1:amd64 \
    libxcb-xprint0:amd64 \
    libxcb-xprint0-dev:amd64 \
    libxcb-xtest0:amd64 \
    libxcb-xtest0-dev:amd64 \
    libxcb-xv0:amd64 \
    libxcb-xv0-dev:amd64 \
    libxcb-xvmc0:amd64 \
    libxcb-xvmc0-dev:amd64 \
    libxcb1:amd64 \
    libxcb1-dev:amd64 \
    libxcomposite-dev:amd64 \
    libxcursor-dev:amd64 \
    libxdamage-dev:amd64 \
    libxext-dev:amd64 \
    libxfixes-dev:amd64 \
    libxi-dev:amd64 \
    libxrandr-dev:amd64 \
    libxrender-dev:amd64 \
    libxslt-dev:amd64 \
    libxss-dev:amd64 \
    libxtst-dev:amd64 \
    libexpat1-dev:amd64 \
    libevdev-dev:amd64 \
    libxkbcommon-dev:amd64 \
    libxkbcommon-x11-dev:amd64

RUN update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-5 10
RUN update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-5 10

RUN mkdir /build

WORKDIR /build

RUN wget -q http://dbus.freedesktop.org/releases/dbus/dbus-1.10.14.tar.gz
RUN tar -zxf dbus-1.10.14.tar.gz

WORKDIR /build/dbus-1.10.14

RUN ./configure \
    --build=x86_64-pc-linux-gnu \
    "CFLAGS=-m64" \
    "CXXFLAGS=-m64" \
    "LDFLAGS=-m64"

RUN make -k -j$(nproc --all)
RUN make install

WORKDIR /build

RUN wget -q http://www.zlib.net/zlib-1.2.11.tar.gz
RUN tar -zxf zlib-1.2.11.tar.gz

WORKDIR /build/zlib-1.2.11

RUN CFLAGS=-m64 \
    ./configure
    
RUN make -k -j$(nproc --all)
RUN make install

WORKDIR /build

RUN wget -q https://openssl.org/source/openssl-1.0.2k.tar.gz
RUN tar -zxf openssl-1.0.2k.tar.gz

WORKDIR /build/openssl-1.0.2k

RUN setarch x86_64 \
    ./config \
    -m64 \
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

RUN sed -i -E -e 's|(QMAKE\_LFLAGS.*)|\1 -ldl|g' qtbase/mkspecs/linux-g++-64/qmake.conf

RUN ./configure \
    -v \
    -static \
    -release \
    -platform linux-g++-64 \
    -opensource \
    -confirm-license \
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
#    -sql-mysql \
#    -sql-psql \
    -sqlite \
    \
    -dbus-linked \
    \
    -openssl-linked \
    \
    -I/usr/local/ssl/include \
    -I/usr/local/include

RUN make -k -j$(nproc --all)
RUN make -k install

RUN update-alternatives --install /usr/bin/qmake qmake /usr/local/Qt-5.8.0/bin/qmake 10

RUN rm -rf /build

RUN mkdir /src