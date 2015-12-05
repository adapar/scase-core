TEMPLATE = subdirs

SUBDIRS += \
    App \
    Test \
    Lib

App.depends = Lib
Test.depends = Lib
