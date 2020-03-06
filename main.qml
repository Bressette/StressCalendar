import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 1.4
import QtQuick.Layouts 1.3

//file that displays the main calendar view
Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("Calendar")
    id: rootId

    //rectangle used to create the main screen
    Rectangle
    {
        id: calendarScreenId
        width: parent.width
        height: parent.height
        visible: true



        //rectangle used to create the left sidebar
        Rectangle {
            id: graphSidebarBackgroundId
            width: rootId.width * (2/10)
            height: rootId.height
            color: "#1aff01"

            //text used to title the mood monthly stats contains text "Monthly Progress"

            Text {
                id: moodTitleId
                width: parent.width
                height: parent.height / 10


                horizontalAlignment: Text.AlignHCenter
                anchors.left: parent.left

                text: qsTr("Monthly Progress")
                font.pointSize: parent.width / 8
                wrapMode: Text.WordWrap
            }

            Rectangle
            {
                id: alignmentRect
                width: moodTitleId.implicitWidth
                height: moodTitleId.implicitHeight
                color: "transparent"
            }

            ColumnLayout
            {
                x: 0.02604 * graphSidebarBackgroundId.width
//                anchors.top: graphSidebarBackgroundId.top
//                anchors.topMargin: parent.height / 7
                anchors.top: alignmentRect.bottom

                Image
                {
                    id: joyId
                    source: "emoticons/joy.png"
                    Layout.preferredWidth: graphSidebarBackgroundId.width / 4.25
                    Layout.preferredHeight: Layout.preferredWidth

                }

                Image
                {
                    id: happyId
                    source: "emoticons/happy.png"
                    Layout.preferredWidth: graphSidebarBackgroundId.width / 4.25
                    Layout.preferredHeight: Layout.preferredWidth
                }

                Image
                {
                    id: sadId
                    source: "emoticons/sad.png"
                    Layout.preferredWidth: graphSidebarBackgroundId.width / 4.25
                    Layout.preferredHeight: Layout.preferredWidth
                }

                Image
                {
                    id: worryId
                    source: "emoticons/worry.png"
                    Layout.preferredWidth: graphSidebarBackgroundId.width / 4.25
                    Layout.preferredHeight: Layout.preferredWidth
                }

                Image
                {
                    id: fearfulId
                    source: "emoticons/fearful.png"
                    Layout.preferredWidth: graphSidebarBackgroundId.width / 4.25
                    Layout.preferredHeight: Layout.preferredWidth
                }

                Image
                {
                    id: angerId
                    source: "emoticons/anger.png"
                    Layout.preferredWidth: graphSidebarBackgroundId.width / 4.25
                    Layout.preferredHeight: Layout.preferredWidth
                }
            }

        }


        //built in calendar QML type that displays the current month with default Calendar behavior
        Calendar {
            id: calendarId
            width: parent.width * (8/10)
            height: parent.height

            anchors.right: parent.right

        }
    }
}
