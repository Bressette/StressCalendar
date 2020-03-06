import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 1.4

//file that displays the main calendar view
Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("Calendar")


    //rectangle used to create the main screen
    Rectangle
    {
        width: parent.width
        height: parent.height
        visible: true

        //rectangle used to create the left sidebar
        Rectangle {
            id: graphSidebar
            width: parent.width * (2/10)
            height: parent.height
            color: "#1aff01"

            //text used to title the mood monthly stats contains text "Monthly Progress"
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

            Image
            {
                source: "emoticons/joy.png"
            }


        }

        //built in calendar QML type that displays the current month with default Calendar behavior
        Calendar {
            width: parent.width * (8/10)
            height: parent.height

            anchors.right: parent.right

        }
    }
}
