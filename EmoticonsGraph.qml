import QtQuick 2.0

Item
{

    property var joyBarWidth
    property var joyBarText
    property var happyBarWidth
    property var happyBarText
    property var sadBarWidth
    property var sadBarText
    property var worriedBarWidth
    property var worriedBarText
    property var fearfulBarWidth
    property var fearfulBarText
    property var angryBarWidth
    property var angryBarText

    property double maxBarWidth : moodTitleId.implicitWidth / 2

    anchors.left: emoticonsCalendarLayoutId.right
    anchors.top: emoticonsCalendarLayoutId.top

    onVisibleChanged:
    {
        joyBarId.width = joyBarWidth
        joyBarId.textContent = joyBarText
        happyBarId.width = happyBarWidth
        happyBarId.textContent = happyBarText
        sadBarId.width = sadBarWidth
        sadBarId.textContent = sadBarText
        worriedBarId.width = worriedBarWidth
        worriedBarId.textContent = worriedBarText
        fearfulBarId.width = fearfulBarWidth
        fearfulBarId.textContent = fearfulBarText
        angryBarId.width = angryBarWidth
        angryBarId.textContent = angryBarText
    }

    GraphBar
    {
        id: joyBarId
        width: joyBarWidth
        textContent: joyBarText
        color: "orange"
        anchors.top: parent.top
        anchors.topMargin: imageSize / 9


    }

    GraphBar
    {
        id: happyBarId
        width: happyBarWidth
        textContent: happyBarText
        color: "yellow"
        anchors.top: joyBarId.bottom
        anchors.topMargin: imageSize / 3.75
    }

    GraphBar
    {
        id: sadBarId
        width: sadBarWidth
        textContent: sadBarText
        color: "blue"
        anchors.top: happyBarId.bottom
        anchors.topMargin: imageSize / 3.75
    }

    GraphBar
    {
        id: worriedBarId
        width: worriedBarWidth
        textContent: worriedBarText
        color: "cyan"
        anchors.top: sadBarId.bottom
        anchors.topMargin: imageSize / 3.75
    }

    GraphBar
    {
        id: fearfulBarId
        width: fearfulBarWidth
        textContent: fearfulBarText
        color: "purple"
        anchors.top: worriedBarId.bottom
        anchors.topMargin: imageSize / 3.75
    }

    GraphBar
    {
        id: angryBarId
        width: angryBarWidth
        textContent: angryBarText
        color: "red"
        anchors.top: fearfulBarId.bottom
        anchors.topMargin: imageSize / 3.75
    }
}
