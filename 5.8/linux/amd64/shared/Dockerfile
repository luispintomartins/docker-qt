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
    lib32gcc-5-dev \
    lib32stdc++-5-dev \
    libssl-dev \
    libcrypto++-dev \
    libsqlite3-dev \
    libmysqlclient-dev \
    libpq-dev \
    ibgstreamer-plugins-base0.10-dev \
    libasound2-dev \
    libatkmm-1.6-dev \
    libbz2-dev \
    libcap-dev \
    libcups2-dev \
    libdrm-dev \
    libegl1-mesa-dev \
    libfontconfig1-dev \
    libfreetype6-dev \
    libgcrypt20-dev \
    libglu1-mesa-dev \
    libgstreamer0.10-dev \
    libicu-dev \
    libnss3-dev \
    libpci-dev \
    libpulse-dev \
    libssl-dev \
    libudev-dev \
    libx11-dev \
    libx11-xcb-dev \
    libxcb-composite0 \
    libxcb-composite0-dev \
    libxcb-cursor-dev \
    libxcb-cursor0 \
    libxcb-damage0 \
    libxcb-damage0-dev \
    libxcb-dpms0 \
    libxcb-dpms0-dev \
    libxcb-dri2-0 \
    libxcb-dri2-0-dev \
    libxcb-dri3-0 \
    libxcb-dri3-dev \
    libxcb-ewmh-dev \
    libxcb-ewmh2 \
    libxcb-glx0 \
    libxcb-glx0-dev \
    libxcb-icccm4 \
    libxcb-icccm4-dev \
    libxcb-image0 \
    libxcb-image0-dev \
    libxcb-keysyms1 \
    libxcb-keysyms1-dev \
    libxcb-present-dev \
    libxcb-present0 \
    libxcb-randr0 \
    libxcb-randr0-dev \
    libxcb-record0 \
    libxcb-record0-dev \
    libxcb-render-util0 \
    libxcb-render-util0-dev \
    libxcb-render0 \
    libxcb-render0-dev \
    libxcb-res0 \
    libxcb-res0-dev \
    libxcb-screensaver0 \
    libxcb-screensaver0-dev \
    libxcb-shape0 \
    libxcb-shape0-dev \
    libxcb-shm0 \
    libxcb-shm0-dev \
    libxcb-sync-dev \
    libxcb-sync0-dev \
    libxcb-sync1 \
    libxcb-util-dev \
    libxcb-util0-dev \
    libxcb-util1 \
    libxcb-xevie0 \
    libxcb-xevie0-dev \
    libxcb-xf86dri0 \
    libxcb-xf86dri0-dev \
    libxcb-xfixes0 \
    libxcb-xfixes0-dev \
    libxcb-xinerama0 \
    libxcb-xinerama0-dev \
    libxcb-xkb-dev \
    libxcb-xkb1 \
    libxcb-xprint0 \
    libxcb-xprint0-dev \
    libxcb-xtest0 \
    libxcb-xtest0-dev \
    libxcb-xv0 \
    libxcb-xv0-dev \
    libxcb-xvmc0 \
    libxcb-xvmc0-dev \
    libxcb1 \
    libxcb1-dev \
    libxcomposite-dev \
    libxcursor-dev \
    libxdamage-dev \
    libxext-dev \
    libxfixes-dev \
    libxi-dev \
    libxrandr-dev \
    libxrender-dev \
    libxslt-dev \
    libxss-dev \
    libxtst-dev

RUN update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-5 10
RUN update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-5 10

RUN mkdir /build

WORKDIR /build

RUN wget -q https://download.qt.io/snapshots/qt/5.8/5.8.0/latest_src/qt-everywhere-opensource-src-5.8.0.tar.gz
RUN tar -zxf qt-everywhere-opensource-src-5.8.0.tar.gz

WORKDIR  ./qt-everywhere-opensource-src-5.8.0

RUN ./configure \
    -v \
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
    -skip qtwebchannel \
    -skip qtwebkit \
    -skip qtwebsockets \
    -skip qtwebview \
    -skip qtxmlpatterns \
    -skip qtwinextras \

5.8.0   Qt
  5.8.0   Qt
  5.8.0   Qt
  5.8.0   Qt
   5.8.0   Qt
   5.8.0   Qt
  5.8.0   Qt
    5.8.0   Qt
 5.8.0   Qt
    5.8.0   Qt
    5.8.0   Qt
 5.8.0   Qt
   5.8.0   Qt
 5.8.0   Qt
 5.8.0   Qt
    5.8.0   Qt
    5.8.0   Qt
    5.8.0   Qt
   5.8.0   Qt
   5.8.0   Qt



    -skip qtwebkit \
    -skip qtwebsockets \
    -skip qtwebkit-examples \
    -skip qtwebchannel \
    -skip qtwebengine \
    -skip qtwayland \
    -skip qtwinextras \
    -skip qtsvg \
    -skip qtsensors \
    -skip qtcanvas3d \
    -skip qtconnectivity \
    -skip declarative \
    -skip multimedia \
    -skip quick1 \
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
    -sql-mysql \
    -sql-psql \
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