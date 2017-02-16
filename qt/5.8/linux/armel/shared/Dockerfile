FROM dockcross/base:latest

# See: https://github.com/dockcross/dockcross

RUN dpkg --add-architecture armel

RUN echo "deb http://emdebian.org/tools/debian/ jessie main" >> /etc/apt/sources.list && \
    dpkg --add-architecture armel && \
    curl http://emdebian.org/tools/debian/emdebian-toolchain-archive.key | apt-key add -

RUN apt-get update

RUN apt-get install -y \
    wget \
    tar \
    coreutils \
    bison \
    flex \
    gperf \
    perl \
    python \
    ruby \
    qt5-qmake \
    crossbuild-essential-armel \
    gfortran-arm-linux-gnueabi \
    ncurses-dev:armel \
    libexpat1-dev:armel \
    libfl-dev:armel \
    libssl-dev:armel \
    libcrypto++-dev:armel \
    libsqlite3-dev:armel \
#    libmysqlclient-dev:armel \
#    libpq-dev:armel \
    ibgstreamer-plugins-base0.10-dev:armel \
    libasound2-dev:armel \
    libatkmm-1.6-dev:armel \
    libbz2-dev:armel \
    libcap-dev:armel \
    libcups2-dev:armel \
    libdrm-dev:armel \
    libegl1-mesa-dev:armel \
    libfontconfig1-dev:armel \
    libfreetype6-dev:armel \
    libgcrypt20-dev:armel \
    libglu1-mesa-dev:armel \
    libgstreamer0.10-dev:armel \
    libicu-dev:armel \
    libnss3-dev:armel \
    libpci-dev:armel \
    libpulse-dev:armel \
    libudev-dev:armel \
    libx11-dev:armel \
    libx11-xcb-dev:armel \
    libxcb-composite0:armel \
    libxcb-composite0-dev:armel \
    libxcb-cursor-dev:armel \
    libxcb-cursor0:armel \
    libxcb-damage0:armel \
    libxcb-damage0-dev:armel \
    libxcb-dpms0:armel \
    libxcb-dpms0-dev:armel \
    libxcb-dri2-0:armel \
    libxcb-dri2-0-dev:armel \
    libxcb-dri3-0:armel \
    libxcb-dri3-dev:armel \
    libxcb-ewmh-dev:armel \
    libxcb-ewmh2:armel \
    libxcb-glx0:armel \
    libxcb-glx0-dev:armel \
    libxcb-icccm4:armel \
    libxcb-icccm4-dev:armel \
    libxcb-image0:armel \
    libxcb-image0-dev:armel \
    libxcb-keysyms1:armel \
    libxcb-keysyms1-dev:armel \
    libxcb-present-dev:armel \
    libxcb-present0:armel \
    libxcb-randr0:armel \
    libxcb-randr0-dev:armel \
    libxcb-record0:armel \
    libxcb-record0-dev:armel \
    libxcb-render-util0:armel \
    libxcb-render-util0-dev:armel \
    libxcb-render0:armel \
    libxcb-render0-dev:armel \
    libxcb-res0:armel \
    libxcb-res0-dev:armel \
    libxcb-screensaver0:armel \
    libxcb-screensaver0-dev:armel \
    libxcb-shape0:armel \
    libxcb-shape0-dev:armel \
    libxcb-shm0:armel \
    libxcb-shm0-dev:armel \
    libxcb-sync-dev:armel \
    libxcb-sync0-dev:armel \
    libxcb-sync1:armel \
#    libxcb-util-dev:armel \
    libxcb-util0-dev:armel \
#    libxcb-util1:armel \
    libxcb-xevie0:armel \
    libxcb-xevie0-dev:armel \
    libxcb-xf86dri0:armel \
    libxcb-xf86dri0-dev:armel \
    libxcb-xfixes0:armel \
    libxcb-xfixes0-dev:armel \
    libxcb-xinerama0:armel \
    libxcb-xinerama0-dev:armel \
    libxcb-xkb-dev:armel \
    libxcb-xkb1:armel \
    libxcb-xprint0:armel \
    libxcb-xprint0-dev:armel \
    libxcb-xtest0:armel \
    libxcb-xtest0-dev:armel \
    libxcb-xv0:armel \
    libxcb-xv0-dev:armel \
    libxcb-xvmc0:armel \
    libxcb-xvmc0-dev:armel \
    libxcb1:armel \
    libxcb1-dev:armel \
    libxcomposite-dev:armel \
    libxcursor-dev:armel \
    libxdamage-dev:armel \
    libxext-dev:armel \
    libxfixes-dev:armel \
    libxi-dev:armel \
    libxrandr-dev:armel \
    libxrender-dev:armel \
    libxslt-dev:armel \
    libxss-dev:armel \
    libxtst-dev:armel

RUN mkdir /build

WORKDIR /build

RUN wget -q https://download.qt.io/snapshots/qt/5.8/5.8.0/latest_src/qt-everywhere-opensource-src-5.8.0.tar.gz
RUN tar -zxf qt-everywhere-opensource-src-5.8.0.tar.gz

WORKDIR  /build/qt-everywhere-opensource-src-5.8.0

RUN ./configure \
    -v \
    -release \
    -opensource \
    -confirm-license \
    \
    -xplatform linux-arm-gnueabi-g++ \
    -sysroot / \
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
    -no-evdev \
    -no-xkbcommon-evdev \
    \
    -qt-xcb \
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
    -dbus-runtime \
    \
    -openssl-runtime

RUN make -k -j$(nproc --all)
RUN make -k install

RUN update-alternatives --install /usr/bin/qmake qmake /usr/local/Qt-5.8.0/bin/qmake 10

RUN rm -rf /build

RUN mkdir /src