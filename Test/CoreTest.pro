QT += core testlib
QT -= gui

TARGET = SCASETest
CONFIG += console
CONFIG -= app_bundle
CONFIG += testcase

TEMPLATE = app

SOURCES += main.cpp \
    coretest.cpp

HEADERS += \
    coretest.h

INCLUDEPATH += $$PWD/../Lib

LIBS += -L$$OUT_PWD/../Lib/ -lLib
