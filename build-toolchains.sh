#!/bin/bash
set -e 

QT_VERSION="5.8"
BUILD_DIR="$PWD"

function clean {
    # See: https://github.com/docker/docker/issues/3182

    # Delete 'exited' containers
    docker rm -v $(docker ps -a -q -f status=exited) &> /dev/null
    # Delete 'dangling' images
    docker rmi $(docker images -f "dangling=true" -q) &> /dev/null
    # Delete 'dangling' volumes
    docker volume rm $(docker volume ls -qf dangling=true) &> /dev/null
}

function build {
    echo ""
    echo "********************************************************************************"
    echo "* BUILD TOOLCHAIN : qt.$1.$2.$3:$QT_VERSION"
    echo "********************************************************************************"
    echo ""
    if [ -z "$(docker images -q qt.$1.$2.$3":"$QT_VERSION)" ]; then
        cd "$BUILD_DIR/qt/$QT_VERSION/$1/$2/$3" && docker build -t "qt.$1.$2.$3":"$QT_VERSION" .
    else
        echo "Docker image already built, skipping..."
    fi
}

# clean pending docker images
trap 'clean' ERR

# STATIC

build windows i386 static
build windows amd64 static
build linux i386 static
build linux amd64 static
build linux armhf static

# SHARED

build windows i386 shared
build windows amd64 shared
build linux i386 shared
build linux amd64 shared
build linux armhf shared
