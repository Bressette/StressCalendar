import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4
import QtQuick.Layouts 1.3
import QtQuick.LocalStorage 2.12
import "DatabaseFunctions.js" as DB
import "SetUIValues.js" as SetVals

Rectangle
{
    id: dayRectId
    width: calendarId.height * 0.5
    height: calendarId.height * 0.5
    color: "grey"
    anchors.centerIn: parent

    //property bindings so that other files can change the values
    property int rectWidth : width
    property int rectHeight : height

    property string dataStatusText
    property string dateText
    property int dateTextSize
    property int dataStatusSize


    //Text object that displays the date
    Text
    {
        id: dateTextId
        text: qsTr(dateText)
        anchors.horizontalCenter: parent.horizontalCenter
        horizontalAlignment: Text.AlignHCenter
        font.pointSize: dateTextSize
    }

    //Text object that displays whether the day has been accessed before
    //displaying "No Data" if it has not been accessed and "Holds Data" if it has been accessed
    Text
    {
        id: dataStatusId
        text: qsTr(dataStatusText)

        anchors.top: dateTextId.bottom
        anchors.horizontalCenter: parent.horizontalCenter

        horizontalAlignment: Text.AlignHCenter
        font.pointSize: dataStatusSize
    }

    //Rectangle object used to create the edit button
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

        //text that places the text "Edit" inside of the editButton rectangle
        Text
        {
            id: editTextId
            text: qsTr("Edit")
            anchors.centerIn: parent
            horizontalAlignment: Text.AlignHCenter
            font.pointSize: editButtonId.height / 2
        }

        //defines a MouseArea and an onClick function to change the view to the UserInputScreen
        MouseArea
        {
            id: editButtonMouseAreaId
            anchors.fill: parent

            onClicked:
            {
                //change the visibility to change screens
                calendarScreenId.visible = false
                userInputObjectId.visible = true

                //update the date that is displayed on the userInputScreen to be the same date
                //that was clicked on the calendar
                userInputObjectId.day = enterInputRectId.day
                userInputObjectId.month = enterInputRectId.month
                userInputObjectId.year = enterInputRectId.year
            }
        }
    }


        //rectangle object used to create the recent feedback button
        Rectangle
        {
            id: recentFeedbackButtonId
            width: parent.width * 0.75
            height: parent.height / 5

            anchors.top: editButtonId.bottom
            anchors.topMargin: 5
            anchors.left: editButtonId.left

            color: "white"
            border.color: "black"
            border.width: 5

            //text object that contains the text "Recent Feedback" and is fit to its parent
            Text
            {
                id: recentFeedbackTextId
                width: parent.width
                height: parent.height
                text: "Recent Feedback"
                anchors.centerIn: parent
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter

                //a maximum point size and a minimum point size is defined when the fontSizeMode is Fit
                //where the actual point size will be the size that fits the parent element
                font.pointSize: 100
                minimumPointSize: 10
                fontSizeMode: Text.HorizontalFit
            }

            //MouseArea that represents the recent feedback button
            MouseArea
            {
                id: recentFeedbackButtonMouseAreaId
                anchors.fill: parent

                onClicked:
                {
                    //sets the weekly feedback values
                    SetVals.setWeeklyFeedback()
                    //changes visibility so that the recent feedback popup screen is displayed
                    outsideRecentFeedbackId.visible = true
                    enterInputRectId.visible = false
                }
            }
        }




}
