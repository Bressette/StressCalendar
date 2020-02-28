import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 1.4

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("Calendar")

    Rectangle {
        id: graphSidebar
        width: parent.width * (2/10)
        height: parent.height
        color: "#1aff01"

        Text {
            id: moodTitle
            width: parent.width
            height: parent.height / 10

            horizontalAlignment: Text.AlignHCenter
            anchors.left: parent.left

            text: qsTr("Monthly Progress")
            font.pointSize: parent.width / 8
            wrapMode: Text.WordWrap
        }
    }


    Calendar {
        width: parent.width * (8/10)
        height: parent.height

        anchors.right: parent.right

    }
}
