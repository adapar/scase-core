#-------------------------------------------------
#
# Project created by QtCreator 2015-12-01T00:32:28
#
#-------------------------------------------------

QT       += core gui xml multimedia

greaterThan(QT_MAJOR_VERSION, 4): QT += widgets

DEFINES += SCASE_FULLSCREEN

debug {
    DEFINES += SCASE_DEBUG_LEVEL_VERBOSE
}

QMAKE_LFLAGS += -Wall

TARGET = App
TEMPLATE = app

CONFIG += x86_64
CONFIG -= x86

SOURCES += main.cpp\
        mainwindow.cpp

HEADERS  += mainwindow.h

INCLUDEPATH += $$PWD/../Lib

LIBS += -L$$OUT_PWD/../Lib/ -lLib
