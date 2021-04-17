TARGET = project-name-app
VERSION = 1.0.0

CONFIG += c++17
QMAKE_CXXFLAGS += -std=c++17 \
               -Wunused-parameter

# disables all the APIs deprecated before Qt 6.0.0
DEFINES += \
        QT_DISABLE_DEPRECATED_BEFORE=0x060000 \
        COMMIT_ID=\\\"$$system(git describe --always)\\\" \
        VERSION_NAME=\\\"$$system(git describe --abbrev=0)\\\"


QT += \
    quick \
    quickcontrols2 \
#    location \
#    network \
#    positioning \
#    svg \
#    webview \
#    sql


TRANSLATIONS += \
    translations/awlobo_myapp_es.ts \


SOURCES += \
        src/main.cpp \
        src/style.cpp

HEADERS += \
        src/headers/style.h


RESOURCES += \
        qml/qml.qrc \
        $$PWD/../res/conf/conf.qrc \
#        $$ROOT_DIR/res/fonts/fonts.qrc \
#        $$ROOT_DIR/res/images/images.qrc \

INCLUDEPATH += \
    $$PWD/src \

QML_IMPORT_PATH = $$PWD/imports

QML_DESIGNER_IMPORT_PATH =

# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target
