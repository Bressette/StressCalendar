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
                id: emoticonsCalendarLayoutId
                imageSize : graphSidebarId.height / 14
                textEnabled: false
            }


            //Physical Activity title text that contains "Physical Activity
            Text
            {
                id: physcialActivityTitleId
                width: moodTitleId.width
                height: moodTitleId.height

                anchors.top: emoticonsCalendarLayoutId.bottom
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
                anchors.top: emoticonsCalendarLayoutId.bottom

                anchors.topMargin: physcialActivityTitleId.implicitHeight
                textLayoutWidth : calendarScreenId.width >= calendarScreenId.height ? graphSidebarId.height / 27 : graphSidebarId.width / 4
                textPointSize : calendarScreenId.width >= calendarScreenId.height ? graphSidebarId.height / 29 : graphSidebarId.width / 4

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

        //MouseArea that is used to exit the popup window when the user clicks on the sidebar
        MouseArea
        {
            anchors.fill: graphSidebarId
            onClicked:
            {
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

            //popup window that contains text about the selected date and an edit button that lets the user advance to the user input screen
            DayPopup
            {
                id: dayPopupId
                dateTextSize : rectWidth / 12
                dateText : enterInputRectId.month + "/" + enterInputRectId.day + "/" + enterInputRectId.year
                dataStatusSize : rectWidth / 12
                dataStatusText : "No data"

            }

            visible: false
        }

    }


    property int imageSize : graphSidebarId.height / 10

    //code for the user input screen
    Rectangle
    {
        id: userInputScreenId
        anchors.fill: parent
        visible: false


        EmoticonsLayout
        {
            id: emoticonsInputLayoutId
            imageSize : graphSidebarId.height / 11
            anchors.top: parent.top
            anchors.left: parent.left
            anchors.leftMargin: 5
            textEnabled: true

            textSize: graphSidebarId.height / 50
        }

        Text
        {
            id: physcialActivityInputId
            width: moodTitleId.width

            anchors.top: emoticonsInputLayoutId.bottom
            anchors.left: parent.left


            text: qsTr("Physical Activity(minutes)")
            font.pointSize: moodTitleId.font.pointSize / 2
            wrapMode: Text.WordWrap
        }



        TextField
        {
            width: physcialActivityInputId.implicitWidth
            height: graphSidebarId.height * 0.1
            anchors.top: physcialActivityInputId.bottom
            validator: IntValidator {bottom: 0;}
            font.pointSize: height / 3

        }

        Rectangle
        {
            id: lineSeparatorRectId
            width: parent.width / 100
            height: parent.height
            color: "black"
            anchors.left: physcialActivityInputId.right
            anchors.leftMargin: 10
        }

        Rectangle
        {
            id: previousDayRectId
            width: parent.width / 8
            height: parent.height / 15
            color: "grey"
            anchors.left: lineSeparatorRectId.right
            anchors.leftMargin: 5

            MouseArea
            {
                anchors.fill: parent

                onClicked:
                {
                    console.log("Populate fields with data from previous day")
                }
            }



            Text
            {
                id: previousDayText
                width: parent.width
                height: parent.height
                text: "Previous Day"
                anchors.centerIn: parent
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                font.pointSize: 100
                minimumPointSize: 10
                fontSizeMode: Text.Fit
            }

            TextArea
            {
                id: notesTextAreaId
                width: rootId.width - lineSeparatorRectId.x * 1.2
                height: rootId.height - previousDayRectId.height * 2
                anchors.top: previousDayRectId.bottom
                anchors.topMargin: 10
                text: "Enter notes here"
                font.pointSize: 10
            }
        }




        Rectangle
        {
            id: dateAlignmentRectId
            width: parent.width / 8
            height: parent.height / 15
            color: "transparent"
            anchors.horizontalCenter: userInputScreenId.horizontalCenter



            Text
            {
                id: userInputDateText
                width: parent.width
                height: parent.height
                property string day : enterInputRectId.day
                property string month : enterInputRectId.month
                property string year : enterInputRectId.year



                text: month + "/" + day + "/" + year
                anchors.centerIn: parent
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                font.pointSize: 100
                minimumPointSize: 10
                fontSizeMode: Text.HorizontalFit

            }
        }


//        Rectangle
//        {
//            id: backToCalendarRectId
//            width: parent.width / 5
//            height: parent.height / 15
//            color: "grey"
//            anchors.horizontalCenter: parent.horizontalCenter

//            //anchors.rightMargin: 5

//            MouseArea
//            {
//                anchors.fill: parent

//                onClicked:
//                {
//                    calendarScreenId.visible = true
//                    userInputScreenId.visible = false
//                    console.log("Switch back to the calendar screen")
//                }
//            }



//            Text
//            {
//                id: backToCalendarText
//                width: parent.width
//                height: parent.height
//                text: "Back to Calendar"
//                anchors.centerIn: parent
//                horizontalAlignment: Text.AlignHCenter
//                verticalAlignment: Text.AlignVCenter
//                font.pointSize: 100
//                minimumPointSize: 10
//                fontSizeMode: Text.HorizontalFit
//            }

//        }
    }

}

