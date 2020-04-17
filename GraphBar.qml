import QtQuick 2.0




Rectangle
{
    width: moodTitleId.implicitWidth / 2
    height: imageSize / 2
    color: "orange"
    anchors.top: emoticonsCalendarLayoutId.top
    anchors.left: emoticonsCalendarLayoutId.right


    anchors.leftMargin: 3

    property var textContent

    Text
    {
        width: parent.width
        height: parent.height
        text: textContent
        anchors.centerIn: parent
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        font.pointSize: 100
        minimumPointSize: 10
        fontSizeMode: Text.Fit

    }
}
