import QtQuick 2.15
import QtQuick.Controls 2.15

import Model 1.0
import MyController 1.0

ApplicationWindow{
    id: root
    width: 680; height: 400
    visible: true

    StatusBar {
        id: stt
        anchors {
            right: parent.right
            left: parent.left
        }
        height: parent.height/15
        z: 1
    }
    StackView{
        id: stView
        anchors {
            top: stt.bottom
            left: parent.left
            right: parent.right
            bottom: parent.bottom
        }

        initialItem: "qrc:/welcome.qml"
    }

    Controller{
        id: myController
    }

    Item{
        focus: true
        Keys.onPressed: {
            if(event.key === Qt.Key_F1)
            {
                if(myController.getStatus() === true)
                {
                    stView.pop(stView.currentItem);
                    stView.push("qrc:/listview.qml");
                    myController.setStatus(false);
                    event.accepted = true;
                }
                else
                {
                    stView.pop(stView.currentItem);
                    stView.push("qrc:/welcome.qml");
                    myController.setStatus(true);
                    event.accepted = true;
                }
            }
        }
    }
}
