#!/bin/bash
CURRENT_PATH=$PWD

QT_VERSION="5.8"

# STATIC

# windows i386
cd $CURRENT_PATH/qt/$QT_VERSION/windows/i386/static     && docker build -t qt.windows.i386.static:$QT_VERSION .
# windows amd64
cd $CURRENT_PATH/qt/$QT_VERSION/windows/amd64/static    && docker build -t qt.windows.amd64.static:$QT_VERSION .
# linux i386
cd $CURRENT_PATH/qt/$QT_VERSION/linux/i386/static       && docker build -t qt.linux.i386.static:$QT_VERSION .
# linux amd64
cd $CURRENT_PATH/qt/$QT_VERSION/linux/amd64/static      && docker build -t qt.linux.amd64.static:$QT_VERSION .
# linux armhf
cd $CURRENT_PATH/qt/$QT_VERSION/linux/armhf/static      && docker build -t qt.linux.armhf.static:$QT_VERSION .

# SHARED

# windows i386
cd $CURRENT_PATH/qt/$QT_VERSION/windows/i386/shared     && docker build -t qt.windows.i386.shared:$QT_VERSION .
# windows amd64
cd $CURRENT_PATH/qt/$QT_VERSION/windows/amd64/shared    && docker build -t qt.windows.amd64.shared:$QT_VERSION .
# linux i386
cd $CURRENT_PATH/qt/$QT_VERSION/linux/i386/shared       && docker build -t qt.linux.i386.shared:$QT_VERSION .
# linux amd64
cd $CURRENT_PATH/qt/$QT_VERSION/linux/amd64/shared      && docker build -t qt.linux.amd64.shared:$QT_VERSION .
# linux armhf
cd $CURRENT_PATH/qt/$QT_VERSION/linux/armhf/shared      && docker build -t qt.linux.armhf.shared:$QT_VERSION .