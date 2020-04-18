import QtQuick 2.0


//rectangle that defines the button
Rectangle
{
    //properties used to change the values of the button
    property var buttonHeight
    property var buttonWidth
    property var buttonColor
    property var textContent


    id: backToCalendarRectId
    width: buttonWidth
    height: buttonHeight
    color: buttonColor


    //text that is fit and centered to the button
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
