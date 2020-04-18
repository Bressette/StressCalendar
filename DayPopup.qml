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


    property int rectWidth : width
    property int rectHeight : height

    property string dataStatusText
    property string dateText
    property int dateTextSize
    property int dataStatusSize


    Text
    {
        id: dateTextId
        text: qsTr(dateText)
        anchors.horizontalCenter: parent.horizontalCenter
        horizontalAlignment: Text.AlignHCenter
        font.pointSize: dateTextSize
    }

    Text
    {
        id: dataStatusId
        text: qsTr(dataStatusText)

        anchors.top: dateTextId.bottom
        anchors.horizontalCenter: parent.horizontalCenter

        horizontalAlignment: Text.AlignHCenter
        font.pointSize: dataStatusSize
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
            font.pointSize: editButtonId.height / 2
        }

        MouseArea
        {
            id: editButtonMouseAreaId
            anchors.fill: parent
            onClicked:
            {
                calendarScreenId.visible = false
                userInputObjectId.visible = true
                userInputObjectId.day = enterInputRectId.day
                userInputObjectId.month = enterInputRectId.month
                userInputObjectId.year = enterInputRectId.year
            }
        }
    }


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

            Text
            {
                id: recentFeedbackTextId
                width: parent.width
                height: parent.height
                text: "Recent Feedback"
                anchors.centerIn: parent
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                font.pointSize: 100
                minimumPointSize: 10
                fontSizeMode: Text.HorizontalFit
            }

            MouseArea
            {
                id: recentFeedbackButtonMouseAreaId
                anchors.fill: parent
                onClicked:
                {
                    SetVals.setWeeklyFeedback()
                    outsideRecentFeedbackId.visible = true
                    enterInputRectId.visible = false
                    console.log("In recent feedback button")
                }
            }
        }




}
