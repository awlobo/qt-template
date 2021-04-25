TARGET = dvo-app
VERSION = 0.0.1

QT += \
    quick \
    quickcontrols2 \

CONFIG += c++11

DEFINES += QT_DEPRECATED_WARNINGS

SOURCES += \
        src/main.cpp \

RESOURCES += \
    qml/qml.qrc \

INCLUDEPATH += \
    $$PWD/src \

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH = $$PWD/imports

# Additional import path used to resolve QML modules just for Qt Quick Designer
QML_DESIGNER_IMPORT_PATH =

# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target
