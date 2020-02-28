import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 1.4

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("Calendar")


//    Rectangle {
//        id: leftRect
//        width: parent.width / 8
//        height: parent.height
//        color: "Red"
//    }

    Rectangle {
        id: graphSidebar
        width: parent.width * (2/10)
        height: parent.height
        color: "#1aff01"
    }


    Calendar {
        width: parent.width * (8/10)
        height: parent.height

        anchors.right: parent.right



//        Button {
//            x: parent.width / 7
//            text: "Button"

//            width: parent.width / 7
//            height: parent.width / 18
//        }
    }
}
