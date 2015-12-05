TEMPLATE = subdirs

SUBDIRS += \
    App \
    Lib

App.depends = Lib
