import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4
import QtQuick.Layouts 1.3
import QtQuick.LocalStorage 2.12
import "DatabaseFunctions.js" as DB
import "SetUIValues.js" as SetVals


//window that displays a window that contains the rest of the UI elements
Window {
    visible: true
    width: 1280
    height: 720
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

            //UI object that contains graph bars for every emoticon and properties bound to each bar
            EmoticonsGraph
            {
                id: emoticonsGraphId

                //set default graph values
                joyBarWidth: 10
                joyBarText: "0"
                happyBarWidth: 10
                happyBarText: "0"
                sadBarWidth: 10
                sadBarText: "0"
                worriedBarWidth: 10
                worriedBarText: "0"
                fearfulBarWidth: 10
                fearfulBarText: "0"
                angryBarWidth: 10
                angryBarText: "0"

            }

            //Physical Activity title text that contains "Physical Activity"
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
                //set the height and width to be proportional with height if width is greater than height and otherwise it is proportional to the width
                textLayoutWidth : calendarScreenId.width >= calendarScreenId.height ? graphSidebarId.height / 27 : graphSidebarId.width / 4
                textPointSize : calendarScreenId.width >= calendarScreenId.height ? graphSidebarId.height / 29 : graphSidebarId.width / 4

            }

            //UI object that contains graph bars for every day of the week and properties bound to each bar
            PhysicalActivityGraph
            {
                id: physicalActivityGraphId

                //set default values for the graph
                mondayBarWidth: 10
                mondayBarText: "0"
                tuesdayBarWidth: 10
                tuesdayBarText: "0"
                wednesdayBarWidth: 10
                wednesdayBarText: "0"
                thursdayBarWidth: 10
                thursdayBarText: "0"
                fridayBarWidth: 10
                fridayBarText: "0"
                saturdayBarWidth: 10
                saturdayBarText: "0"
                sundayBarWidth: 10
                sundayBarText: "0"
            }
        }




        //built in calendar QML type that displays the current month with default Calendar behavior
        Calendar
        {
            id: calendarId
            width: parent.width * (8/10)
            height: parent.height

            anchors.right: parent.right

            /*onClicked function that is called when a day on the calendar is clicked. The day, month and year
             *are retrieved from the selectedDate signal that is emitted by the calendar and this date is stored
             *in the enterInputRectId and userInputObjectId UI objects. Then the user input screen values are set
             *based on the date and the emoticon graph and physical activity graph values are set based on the given month
             */
            onClicked:
            {


                //save the day, month and year of the date that was clicked
                const day = selectedDate.getDate()
                const month = selectedDate.getMonth() + 1
                const year = selectedDate.getFullYear()

                //store the day month and year in other UI objects so that they can be accessed within their focus scope
                enterInputRectId.day = day
                enterInputRectId.month = month
                enterInputRectId.year = year

                userInputObjectId.day = enterInputRectId.day
                userInputObjectId.month = enterInputRectId.month
                userInputObjectId.year = enterInputRectId.year

                //call getDataForDate() to set the values of UI elements based on the isoDate for the day that was clicked
                DB.getDataForDate(enterInputRectId.isoDate)

                //sets the values of the emoticons graph bars to the values retrieved from the database for the month
                SetVals.setEmoticonValues()
                //sets the values of the physical activity graph bars to the values retrieved from the database for the month
                SetVals.setPhysicalActivityValues()
                emoticonsGraphId.visible = false
                emoticonsGraphId.visible = true

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

        //rectangle that fills the screen and allows for a mouse event to be handled if it is outside of the popup window
        //also stores the iso conversion of the month and date
        Rectangle
        {
            id: enterInputRectId
            anchors.fill: calendarId
            color: "transparent"
            anchors.centerIn: calendarId

            //properties that are set by the Calendar onClicked function
            property int day
            property int month
            property int year

            /* sets the isoMonth that is used in database queries by converting the normal month to an isoMonth
             * that has a leading 0 if the value is less than 10 ex: instead of 9 the value will be 09
             * this is necessary for properly formatting the date in sql queries */
            property string isoMonth : SetVals.setIsoMonth(month)

            /* sets the isoDate that is used in database queries by converting the month and days to their iso date
             * equivalents. A leading 0 is adding to any month or day that is less than 10 */
            property string isoDate : SetVals.setIsoDate(year, month, day)



            //this mouse area represents the outside of the edit and recent feedback buttons and exits the popup when clicked
            MouseArea
            {
                anchors.fill: parent
                onClicked:
                {
                    enterInputRectId.visible = false
                }
            }

            //popup window that contains text about the selected date, an edit button that lets the user advance to the user input screen and a recent feedback
            //button that makes the recent feedback popup become visible
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

        //rectangle that fills the screen and allows a MouseArea to be defined to exit from the popup screen
        Rectangle
        {
            id: outsideRecentFeedbackId
            anchors.fill: parent
            color: "transparent"
            anchors.centerIn: calendarId

            //MouseArea that exits the popup screen when clicked
            MouseArea
            {
                anchors.fill: parent
                onClicked:
                {
                    outsideRecentFeedbackId.visible = false
                }
            }

            //UI object that defines the recent feedback popup screen and has the accessible property textContent to
            //change the recent feedback body text
            RecentFeedBackPopup
            {
                id: recentFeedbackPopupId
                textContent: "Not enough data to generate feedback"
                anchors.fill: parent
            }

            visible: false
        }

    }

    //define a property to hold the imageSize used for the emoticons
    property int imageSize : graphSidebarId.height / 10


    //UI object that contains the UserInputScreen where the user can choose a mood, a physical activity value in minutes
    //and type notes about their day
    UserInputScreen
    {
        id: userInputObjectId

        //set default values for accessible properties
        physicalActivityTextFieldText: "0"
        notesTextAreaText: "Enter notes here"
        day : "01"
        month : "01"
        year : "1970"

    }


}

