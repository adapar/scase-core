TEMPLATE = subdirs

SUBDIRS += \
    CoreApp \
    CoreTest \
    CoreLib

CoreApp.depends = CoreLib
CoreTest.depends = CoreLib
