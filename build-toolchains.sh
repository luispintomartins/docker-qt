#!/bin/bash
CURRENT_PATH=$PWD

# windows i386
cd $CURRENT_PATH/qt/5.8/windows/i386/static     && docker build -t qt5.windows.i386.static:5.8 .
# windows amd64
cd $CURRENT_PATH/qt/5.8/windows/amd64/static    && docker build -t qt5.windows.amd64.static:5.8 .
# linux i386
cd $CURRENT_PATH/qt/5.8/linux/i386/static       && docker build -t qt5.linux.i386.static:5.8 .
# linux amd64
cd $CURRENT_PATH/qt/5.8/linux/amd64/static      && docker build -t qt5.linux.amd64.static:5.8 .
# linux armhf
cd $CURRENT_PATH/qt/5.8/linux/armhf/static      && docker build -t qt5.linux.armhf.static:5.8 .
# linux armel
cd $CURRENT_PATH/qt/5.8/linux/armel/static      && docker build -t qt5.linux.armel.static:5.8 .