import QtQuick 2.15
import MyStatus 1.0

Item {
    Rectangle{
        id: sttRec
        anchors.fill: parent
        color: "black"
        Text {
           text: qsTr(StatusBarConf.title)
           font.pointSize: parent.height/2
           color: "white"
           anchors {
               left: parent.left
               verticalCenter: parent.verticalCenter
           }
        }

        Image {
            id: more
            source: StatusBarConf.imageMore
            width: sourceSize.width*(parent.height/sourceSize.height)
            anchors {
                right: parent.right
                top: parent.top
                bottom: parent.bottom
            }
        }
        Image {
            id: noWifi
            source: StatusBarConf.imageNoWifi
            width: sourceSize.width*(parent.height/sourceSize.height)
            anchors {
                right: more.left
                top: parent.top
                bottom: parent.bottom
            }
        }
        Image {
            id: lock
            source: StatusBarConf.imageLock
            width: sourceSize.width*(parent.height/sourceSize.height)
            anchors {
                right: noWifi.left
                top: parent.top
                bottom: parent.bottom
            }
        }
    }
}
