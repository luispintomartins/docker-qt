#!/bin/bash

GCC_CFLAGS="-m64"
GCC_CPPFLAGS="-m64"
GCC_LDFLAGS="-m64"
GCC_HOST="x86_64-pc-linux-gnu"
GCC_BUILD="x86_64-pc-linux-gnu"
GCC_TARGET="x86_64-pc-linux-gnu"
TARGET_ARCH="amd64"
TARGET_ARCH_HOST=$TARGET_ARCH"-linux-gnu"
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
    libevdev-dev:$TARGET_ARCH

update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-5 10
update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-5 10

mkdir /build

# +++++++++++++++++++++++++++++++++++++++++++
# + PTHREADS
# +++++++++++++++++++++++++++++++++++++++++++
# 
# cd /build
# 
# mkdir -p '$TARGET_PREFIX/lib/pkgconfig/'' \
#     && echo "prefix='$TARGET_PREFIX'"              > '$TARGET_PREFIX/lib/pkgconfig/pthread.pc' \
#     && echo "exec_prefix=${prefix}"                 >> '$TARGET_PREFIX/lib/pkgconfig/pthread.pc' \
#     && echo "libdir=${exec_prefix}/lib"             >> '$TARGET_PREFIX/lib/pkgconfig/pthread.pc' \
#     && echo "sharedlibdir=${libdir}"                >> '$TARGET_PREFIX/lib/pkgconfig/pthread.pc' \
#     && echo "includedir=${prefix}/include"          >> '$TARGET_PREFIX/lib/pkgconfig/pthread.pc' \
#     && echo ""                                      >> '$TARGET_PREFIX/lib/pkgconfig/pthread.pc' \
#     && echo "Name: pthreads"                        >> '$TARGET_PREFIX/lib/pkgconfig/pthread.pc' \
#     && echo "Description: Posix Threads pthreads"   >> '$TARGET_PREFIX/lib/pkgconfig/pthread.pc' \
#     && echo "Version: POSIX 1003.1-2001"            >> '$TARGET_PREFIX/lib/pkgconfig/pthread.pc' \
#     && echo ""                                      >> '$TARGET_PREFIX/lib/pkgconfig/pthread.pc' \
#     && echo "Requires:"                             >> '$TARGET_PREFIX/lib/pkgconfig/pthread.pc' \
#     && echo "Libs: -lpthread"                       >> '$TARGET_PREFIX/lib/pkgconfig/pthread.pc'
# 
# +++++++++++++++++++++++++++++++++++++++++++
# + YASM
# +++++++++++++++++++++++++++++++++++++++++++
# 
# cd /build
# 
# wget -q http://www.tortall.net/projects/yasm/releases/yasm-1.3.0.tar.gz
# tar -zxf yasm-1.3.0.tar.gz
# 
# cd /build/yasm-1.3.0
# 
# CFLAGS=$GCC_CFLAGS \
# CPPFLAGS=$GCC_CPPFLAGS \
# LDFLAGS=$GCC_LDFLAGS \
#     ./configure \
#     --disable-nls \
#     --disable-python \
#     --enable-static \
#     --disable-shared \
#     --libdir='$TARGET_PREFIX/lib/' \
#     --includedir='$TARGET_PREFIX/include/' \
#     --build=$GCC_BUILD \
#     --host=$GCC_HOST \
#     --target=$GCC_TARGET
# 
# make -j$(nproc --all)
# make install
# 
# +++++++++++++++++++++++++++++++++++++++++++
# + EXPAT
# +++++++++++++++++++++++++++++++++++++++++++
# 
# cd /build
# 
# wget -q http://sourceforge.net/projects/expat/files/expat/2.2.0/expat-2.2.0.tar.bz2
# tar -jxf expat-2.2.0.tar.bz2
# 
# cd /build/expat-2.2.0
# 
# CFLAGS=$GCC_CFLAGS \
# CPPFLAGS=$GCC_CPPFLAGS \
# LDFLAGS=$GCC_LDFLAGS \
#     ./configure \
#     --enable-static \
#     --disable-shared \
#     --libdir='$TARGET_PREFIX/lib/' \
#     --includedir='$TARGET_PREFIX/include/' \
#     --build=$GCC_BUILD \
#     --host=$GCC_HOST \
#     --target=$GCC_TARGET
# 
# make -j$(nproc --all)
# make install
# 
# +++++++++++++++++++++++++++++++++++++++++++
# + BZIP2
# +++++++++++++++++++++++++++++++++++++++++++
# 
# cd /build
# 
# wget -q http://www.bzip.org/1.0.6/bzip2-1.0.6.tar.gz
# tar -zxf bzip2-1.0.6.tar.gz
# 
# cd /build/bzip2-1.0.6
# 
# CFLAGS=$GCC_CFLAGS \
# CPPFLAGS=$GCC_CPPFLAGS \
# LDFLAGS=$GCC_LDFLAGS \
#     make -j$(nproc --all) \
#     libbz2.a
# 
# make install
# 
# +++++++++++++++++++++++++++++++++++++++++++
# + ZLIB
# +++++++++++++++++++++++++++++++++++++++++++

cd /build

wget -q http://zlib.net/zlib-1.2.11.tar.gz
tar -zxf zlib-1.2.11.tar.gz

cd /build/zlib-1.2.11

CFLAGS=$GCC_CFLAGS \
CPPFLAGS=$GCC_CPPFLAGS \
LDFLAGS=$GCC_LDFLAGS \
    ./configure \
    --static

make -j$(nproc --all)
make install

# +++++++++++++++++++++++++++++++++++++++++++
# + LIBJPEG
# +++++++++++++++++++++++++++++++++++++++++++
# 
# cd /build
# 
# wget -q http://downloads.sourceforge.net/libjpeg-turbo/libjpeg-turbo-1.5.1.tar.gz
# tar -zxf libjpeg-turbo-1.5.1.tar.gz
# 
# cd /build/libjpeg-turbo-1.5.1
# 
# CFLAGS=$GCC_CFLAGS \
# CPPFLAGS=$GCC_CPPFLAGS \
# LDFLAGS=$GCC_LDFLAGS \
#     ./configure \
#     NASM=yasm \
#     --enable-static \
#     --disable-shared \
#     --libdir='$TARGET_PREFIX/lib/' \
#     --includedir='$TARGET_PREFIX/include/' \
#     --build=$GCC_BUILD \
#     --host=$GCC_HOST \
#     --target=$GCC_TARGET
# 
# make -j$(nproc --all)
# make install
# 
# +++++++++++++++++++++++++++++++++++++++++++
# + LIBPNG
# +++++++++++++++++++++++++++++++++++++++++++
# 
# cd /build
# 
# wget -q http://downloads.sourceforge.net/libpng/libpng-1.6.28.tar.xz
# tar -Jxf libpng-1.6.28.tar.xz
# 
# cd /build/libpng-1.6.28
# 
# CFLAGS=$GCC_CFLAGS \
# CPPFLAGS=$GCC_CPPFLAGS \
# LDFLAGS="GCC_LDFLAGS -L'"$TARGET_PREFIX"/lib' -lz" \
#     ./configure \
#     --with-pkgconfigdir='$TARGET_PREFIX/lib/pkgconfig/' \
#     --with-zlib-prefix='$TARGET_PREFIX/lib/' \
#     --enable-static \
#     --disable-shared \
#     --libdir='$TARGET_PREFIX/lib/' \
#     --includedir='$TARGET_PREFIX/include/' \
#     --build=$GCC_BUILD \
#     --host=$GCC_HOST \
#     --target=$GCC_TARGET
# 
# make -j$(nproc --all)
# make install
# 
# +++++++++++++++++++++++++++++++++++++++++++
# + HARFBUZZ
# +++++++++++++++++++++++++++++++++++++++++++
# 
# cd /build
# 
# wget -q http://www.freedesktop.org/software/harfbuzz/release/harfbuzz-1.4.2.tar.bz2
# tar -jxf harfbuzz-1.4.2.tar.bz2
# 
# cd /build/harfbuzz-1.4.2
# 
# CFLAGS=$GCC_CFLAGS \
# CPPFLAGS=$GCC_CPPFLAGS \
# LDFLAGS=$GCC_LDFLAGS \
#     ./configure \
#     ac_cv_header_sys_mman_h=no \
#     LIBS='-lstdc++' \
#     --enable-static \
#     --disable-shared \
#     --libdir='$TARGET_PREFIX/lib/' \
#     --includedir='$TARGET_PREFIX/include/' \
#     --build=$GCC_BUILD \
#     --host=$GCC_HOST \
#     --target=$GCC_TARGET
# 
# make -j$(nproc --all)
# make install
# 
# +++++++++++++++++++++++++++++++++++++++++++
# + FREETYPE
# +++++++++++++++++++++++++++++++++++++++++++
# 
# cd /build
# 
# wget -q http://downloads.sourceforge.net/freetype/freetype-2.7.1.tar.bz2
# tar -jxf freetype-2.7.1.tar.bz2
# 
# cd /build/freetype-2.7.1
# 
# CFLAGS=$GCC_CFLAGS \
# CPPFLAGS=$GCC_CPPFLAGS \
# LDFLAGS=$GCC_LDFLAGS \
#     ./configure \
#     --without-harfbuzz \
#     LIBPNG_CFLAGS="-I'"$TARGET_PREFIX"/include/libpng16'" \
#     LIBPNG_LDFLAGS="-L'"$TARGET_PREFIX"/lib' -lpng16" \
#     FT2_EXTRA_LIBS="-L'"$TARGET_PREFIX"/lib' -lpng16" \
#     HARFBUZZ_LIBS="-L'"$TARGET_PREFIX"/lib' -lharfbuzz -lharfbuzz_too -lglib-2.0" \
#     --enable-static \
#     --disable-shared \
#     --libdir='$TARGET_PREFIX/lib/' \
#     --includedir='$TARGET_PREFIX/include/' \
#     --build=$GCC_BUILD \
#     --host=$GCC_HOST \
#     --target=$GCC_TARGET
# 
# make -j$(nproc --all)
# make install
# 
# +++++++++++++++++++++++++++++++++++++++++++
# + FONTCONFIG
# +++++++++++++++++++++++++++++++++++++++++++
# 
# cd /build
# 
# wget -q http://www.freedesktop.org/software/fontconfig/release/fontconfig-2.12.1.tar.bz2
# tar -jxf fontconfig-2.12.1.tar.bz2
# 
# cd /build/fontconfig-2.12.1
# 
# autoreconf -fi
# CFLAGS=$GCC_CFLAGS \
# CPPFLAGS=$GCC_CPPFLAGS \
# LDFLAGS=$GCC_LDFLAGS \
#     ./configure \
#     --disable-docs \
#     --enable-static \
#     --disable-shared \
#     --libdir='$TARGET_PREFIX/lib/' \
#     --includedir='$TARGET_PREFIX/include/' \
#     --build=$GCC_BUILD \
#     --host=$GCC_HOST \
#     --target=$GCC_TARGET
# 
# make -j$(nproc --all)
# make install
# 
# +++++++++++++++++++++++++++++++++++++++++++
# + OPENSSL
# +++++++++++++++++++++++++++++++++++++++++++

cd /build

wget -q https://openssl.org/source/openssl-1.0.2k.tar.gz
tar -zxf openssl-1.0.2k.tar.gz

cd /build/openssl-1.0.2k

./Configure \
    linux-generic64 \
    $GCC_CFLAGS \
    no-shared \
    no-capieng \
    zlib \
    no-zlib-dynamic

make all -j1 AR="ar rcu"
make install_sw

# +++++++++++++++++++++++++++++++++++++++++++
# + SQLITE
# +++++++++++++++++++++++++++++++++++++++++++
# 
# cd /build
# 
# wget -q http://sqlite.org/2017/sqlite-autoconf-3170000.tar.gz
# tar -zxf sqlite-autoconf-3170000.tar.gz
# 
# cd /build/sqlite-autoconf-3170000
# 
# CFLAGS='$GCC_CFLAGS -Os'\
# CPPFLAGS=$GCC_CPPFLAGS \
# LDFLAGS=$GCC_LDFLAGS \
#     ./configure \
#     --disable-readline \
#     --enable-threadsafe \
#     --enable-static \
#     --disable-shared \
#     --libdir='$TARGET_PREFIX/lib/' \
#     --includedir='$TARGET_PREFIX/include/' \
#     --build=$GCC_BUILD \
#     --host=$GCC_HOST \
#     --target=$GCC_TARGET
# 
# make -j$(nproc --all)
# make install
# 
# +++++++++++++++++++++++++++++++++++++++++++
# + PCRE
# +++++++++++++++++++++++++++++++++++++++++++
# 
# cd /build
# 
# wget -q ftp://ftp.csx.cam.ac.uk/pub/software/programming/pcre/pcre-8.40.tar.bz2
# tar -jxf pcre-8.40.tar.bz2
# 
# cd /build/pcre-8.40
# 
# CFLAGS=$GCC_CFLAGS \
# CPPFLAGS=$GCC_CPPFLAGS \
# LDFLAGS=$GCC_LDFLAGS \
#     ./configure \
#     --enable-pcre16 \
#     --enable-utf \
#     --enable-unicode-properties \
#     --enable-cpp \
#     --disable-pcregrep-libz \
#     --disable-pcregrep-libbz2 \
#     --disable-pcretest-libreadline \
#     --enable-static \
#     --disable-shared \
#     --libdir='$TARGET_PREFIX/lib/' \
#     --includedir='$TARGET_PREFIX/include/' \
#     --build=$GCC_BUILD \
#     --host=$GCC_HOST \
#     --target=$GCC_TARGET
# 
# make -j$(nproc --all)
# make install
# 
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
OPENSSL_LIBS="-L"$TARGET_PREFIX"/ssl/lib -L"$TARGET_PREFIX"/lib -lssl -lcrypto -ldl -lz" \
    ./configure \
    -v \
    -static \
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
    -openssl-linked \
    \
    -no-dbus \
    \
    -I""$TARGET_PREFIX"/ssl/include/" \
    -I""$TARGET_PREFIX"/include/" \
    -I"/usr/include"

make -j$(nproc --all)
make install

update-alternatives --install /usr/bin/qmake qmake $TARGET_PREFIX/Qt-5.8.0/bin/qmake 10

rm -rf /build

mkdir -p /src