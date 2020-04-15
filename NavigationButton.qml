import QtQuick 2.0



Rectangle
{
    property var buttonHeight
    property var buttonWidth
    property var buttonColor
    property var textContent


    id: backToCalendarRectId
    width: buttonWidth
    height: buttonHeight
    color: buttonColor


    Text
    {
        id: backToCalendarText
        width: parent.width
        height: parent.height
        text: textContent
        anchors.centerIn: parent
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        font.pointSize: 100
        minimumPointSize: 10
        fontSizeMode: Text.HorizontalFit
    }

}
