import QtQuick 2.0

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
                console.log("In onclick")
                calendarScreenId.visible = false
                userInputObjectId.visible = true
                userInputObjectId.day = enterInputRectId.day
                userInputObjectId.month = enterInputRectId.month
                userInputObjectId.year = enterInputRectId.year
                //calendarScreenId.visible = false
            }
        }
    }




}
