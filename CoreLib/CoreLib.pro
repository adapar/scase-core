#-------------------------------------------------
#
# Project created by QtCreator 2015-12-01T00:35:32
#
#-------------------------------------------------

QT       += core xml

greaterThan(QT_MAJOR_VERSION, 4): QT += widgets

TARGET = CoreLib
TEMPLATE = lib
CONFIG += staticlib

SOURCES += \
    browser.cpp \
    browseritem.cpp \
    browserlevel.cpp \
    browserpresentationwidget.cpp \
    interactionwidget.cpp \
    pluginhandler.cpp

HEADERS += \
    browser.h \
    browseritem.h \
    browserlevel.h \
    browserpresentationwidget.h \
    interactionwidget.h \
    pluginhandler.h \
    interfaces/IBrowserDelegate.h \
    interfaces/IBrowserItem.h \
    interfaces/IBrowserLevel.h \
    interfaces/IBrowserPresentationDelegate.h \
    interfaces/IPlugin.h

unix {
    target.path = /usr/lib
    INSTALLS += target
}
