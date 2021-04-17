import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Controls.Material 2.15

ApplicationWindow {
    id: window
    width: 640
    height: 480
    visible: true
    title: qsTr("Project-name")

    Component.onCompleted: {
        console.log("COLOR", Style.colors["primary"])
        Material.accent = Style.colors["accent"]
        Material.primary = Style.colors["primary"]
        Material.theme = Material.Dark
    }

    function setDarkTheme() {
        console.log('called')
        Material.theme = Material.Dark
        Material.accent = Style.productNeutralAlmostLight
        Material.primary = Style.productPrimaryBlue
    }
    function setLightTheme() {
        console.log('called')
        Material.theme = Material.Light
        Material.accent = Style.productPrimaryBlue
        Material.primary = Style.productNeutralAlmostLight
    }

    header: ToolBar {
        contentHeight: toolButton.implicitHeight

        ToolButton {
            id: toolButton
            text: stackView.depth > 1 ? "\u25C0" : "\u2630"
            font.pixelSize: Qt.application.font.pixelSize * 1.6
            onClicked: {
                if (stackView.depth > 1) {
                    stackView.pop()
                } else {
                    drawer.open()
                }
            }
        }

        Label {
            text: stackView.currentItem.title
            anchors.centerIn: parent
        }
    }

    Drawer {
        id: drawer
        width: window.width * 0.66
        height: window.height

        Column {
            anchors.fill: parent

            ItemDelegate {
                text: qsTr("Page 1")
                width: parent.width
                onClicked: {
                    stackView.push("Page1Form.qml")
                    drawer.close()
                }
            }
            ItemDelegate {
                text: qsTr("Page 2")
                width: parent.width
                onClicked: {
                    stackView.push("Page2Form.qml")
                    drawer.close()
                }
            }
        }
    }

    StackView {
        id: stackView
        initialItem: "HomeForm.qml"
        anchors.fill: parent
    }
}
