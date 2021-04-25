TEMPLATE = subdirs

SUBDIRS += \
    app \

#linux:!android|macos: SUBDIRS += tests tools

OTHER_FILES += \
    README.md \