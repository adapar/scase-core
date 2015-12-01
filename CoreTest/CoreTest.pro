QT += core testlib
QT -= gui

TARGET = SCASECoreTest
CONFIG += console
CONFIG -= app_bundle
CONFIG += testcase

TEMPLATE = app

SOURCES += main.cpp \
    coretest.cpp

HEADERS += \
    coretest.h

INCLUDEPATH += $$PWD/../CoreLib

LIBS += -L$$OUT_PWD/../CoreLib/ -lCoreLib
