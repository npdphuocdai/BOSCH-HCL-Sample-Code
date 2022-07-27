import QtQuick 2.15
import QtQuick.Controls 2.15

import Model 1.0

Item {
    ListView{
        id: list
        anchors.fill: parent
        snapMode: ListView.SnapOneItem
        orientation: ListView.Horizontal
        highlightRangeMode: ListView.StrictlyEnforceRange
        model: MyModel {}

        delegate: Rectangle{
            id: rectangle
            color: "lightblue"
            width: ListView.view.width
            height: ListView.view.height
            Image {
                id: img
                scale: parent.height / sourceSize.height / 2
                source: model.flag
                anchors {
                    centerIn: parent
                }
            }
            Text {
                id: txt
                text: model.name
                font.pointSize: parent.height/12
                anchors {
                    topMargin: 20
                    top: parent.top
                    horizontalCenter: parent.horizontalCenter
                }
            }
            MouseArea {
                anchors.fill: parent
                onClicked: pop.visible ?  pop.close() : pop.open()
            }
            Popup {
                id: pop
                background: Rectangle {
                    id: poprec
                    anchors.fill: parent
                    opacity: 0.9
                    color: "black"
                }
                anchors.centerIn: Overlay.overlay
                x: Math.round((parent.width - width) / 2)
                y: Math.round((parent.height - height) / 2)
                width: root.width
                height: root.height
                contentItem: Text {
                    color: "white"
                    text: qsTr(model.detail)
                    font.pointSize: 50
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter

                }
                Button {
                    anchors.left: parent.Left
                    anchors.top: parent.Top
                    text: "Back"
                    MouseArea {
                        anchors.fill: parent
                        onClicked: pop.visible ?  pop.close() : pop.open()
                    }
                }
            }
        }
        PageIndicator {
            id: control
            currentIndex: list.currentIndex
            count: list.count
            interactive: true
            delegate: Rectangle {
                width: 8
                height: 8
                radius: width / 2
                color: index === control.currentIndex? "red" : "gray"
                required property int index
            }
            anchors {
                horizontalCenter: parent.horizontalCenter
                bottom: parent.bottom
                bottomMargin: 20
            }
        }
    }
}
