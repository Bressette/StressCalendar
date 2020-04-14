import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 1.4
import QtQuick.Layouts 1.3

//file that displays the main calendar view
Window {
    visible: true
    width: 600
    height: 600
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
            id: graphSidebarId
            width: rootId.width * (2/10)
            height: rootId.height
            color: "#1aff01"

            //text used to title the mood monthly stats and contains text "Monthly Progress"

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

            //rectangle used to align the top of the emoticons to the bottom of the mood title
            Rectangle
            {
                id: alignmentRect
                width: moodTitleId.implicitWidth
                height: moodTitleId.implicitHeight
                color: "transparent"
            }

            //layout that aligns all of the emoticons vertically in a ColumnLayout
            EmoticonsLayout
            {
                id: emoticonsLayoutId
                imageSize : graphSidebarId.height / 14
            }


            //Physical Activity title text that contains "Physical Activity
            Text
            {
                id: physcialActivityTitleId
                width: moodTitleId.width
                height: moodTitleId.height

                anchors.top: emoticonsLayoutId.bottom
                anchors.left: parent.left
                horizontalAlignment: Text.AlignHCenter

                text: qsTr("Physical Activity")
                font.pointSize: moodTitleId.font.pointSize / 1.2
                wrapMode: Text.WordWrap
            }

            //Contains the titles of the days of the week vertically aligned in a ColumnLayout
            DayTitles
            {
                id: dayTitlesId

                x: 0.02604 * graphSidebarId.width
                anchors.top: emoticonsLayoutId.bottom

                anchors.topMargin: physcialActivityTitleId.implicitHeight
                textLayoutWidth : graphSidebarId.height / 27
                textPointSize : graphSidebarId.height / 29

            }


        }






        //built in calendar QML type that displays the current month with default Calendar behavior
        Calendar
        {
            id: calendarId
            width: parent.width * (8/10)
            height: parent.height



            anchors.right: parent.right

            onClicked:
            {
                const day = selectedDate.getDate()
                const month = selectedDate.getMonth() + 1
                const year = selectedDate.getFullYear()
                enterInputRectId.day = day.toString()
                enterInputRectId.month = month.toString()
                enterInputRectId.year = year.toString()


                enterInputRectId.visible = true
            }

        }

        MouseArea
        {
            anchors.fill: graphSidebarId
            onClicked: {
                enterInputRectId.visible = false
            }
        }

        //rectangle that represents the popup window that allows the user to enter data into a date on the calendar
        Rectangle
        {
            id: enterInputRectId
            anchors.fill: calendarId
            color: "transparent"
            anchors.centerIn: calendarId

            property string day
            property string month
            property string year



            //this mouse area represents the outside of the edit button and exits the popup when clicked
            MouseArea
            {
                anchors.fill: parent
                onClicked:
                {
                    console.log("Exiting the input rect " + enterInputRectId.month + "/" + enterInputRectId.day + "/" + enterInputRectId.year)
                    enterInputRectId.visible = false
                }
            }

            Rectangle
            {
                id: dayRectId
                width: calendarId.height * 0.5
                height: calendarId.height * 0.5
                color: "grey"
                anchors.centerIn: parent

                property int calendarWidth : parent.width * (8/10)



//                anchors.topMargin: parent.height * (2.5/10)
//                anchors.rightMargin: calendarWidth * (3.3/10)


                Text
                {
                    id: dateTextId
                    text: qsTr(enterInputRectId.month + "/" + enterInputRectId.day + "/" + enterInputRectId.year)
                    anchors.horizontalCenter: parent.horizontalCenter
                    horizontalAlignment: Text.AlignHCenter
                    font.pointSize: 20
                }

                Text
                {
                    id: dataStatusId
                    text: qsTr("No Data")

                    anchors.top: dateTextId.bottom
                    anchors.horizontalCenter: parent.horizontalCenter

                    horizontalAlignment: Text.AlignHCenter
                    font.pointSize: 20
                }

                Rectangle
                {
                    id: editButtonId
                    width: parent.width * 0.75
                    height: parent.height / 5

                    anchors.top: dataStatusId.bottom
                    anchors.horizontalCenter: parent.horizontalCenter

                    color: "white"
                    border.color: "black"
                    border.width: 5

                    Text
                    {
                        id: editTextId
                        text: qsTr("Edit")
                        anchors.centerIn: parent
                        horizontalAlignment: Text.AlignHCenter
                        font.pointSize: 20
                    }

                    MouseArea
                    {
                        id: editButtonMouseAreaId
                        anchors.fill: parent
                        onClicked: {
                            console.log("In onclick")
                            //calendarScreenId.visible = false
                        }
                    }
                }




            }

            visible: false
        }

    }
}

