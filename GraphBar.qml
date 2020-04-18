import QtQuick 2.0



//Rectangle that defines a graph bar with a default color of orange
Rectangle
{
    width: moodTitleId.implicitWidth / 2
    height: imageSize / 2
    color: "orange"


    anchors.leftMargin: 3

    property var textContent

    //Text that is centered and fit to the parent rectangle
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
