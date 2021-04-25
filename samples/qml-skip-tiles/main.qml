import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Layouts 1.3

Window {
    id:root
    property int generic: 0
    property int tower: 1
    property int grid: 2
    property int none: 3

    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")

    RowLayout {

        Repeater {
            id: repeater
            property var actualCat: none
            model: [{
                    "color": "green",
                    "isAsset": true,
                    "type": tower
                }, {
                    "color": "blue",
                    "isAsset": false,
                    "type": grid
                }, {
                    "color": "red",
                    "isAsset": false,
                    "type": generic
                }, {
                    "color": "red",
                    "isAsset": true,
                    "type": generic
                }, {
                    "color": "red",
                    "isAsset": false,
                    "type": generic
                }, {
                    "color": "red",
                    "isAsset": false,
                    "type": generic
                }]

            RowLayout {
                Rectangle {
                    width: 50
                    height: 50
                    color: modelData.color
                }

                Rectangle {
                    width: 15
                    height: 50
                    color: "black"
                    Component.onCompleted: {
                        if (repeater.actualCat !== modelData.type) {
                            visible = true
                            repeater.actualCat = modelData.type

                        } else {
                            visible = false
                        }
                    }
                }
            }
        }
    }
}
