import QtQuick 2.0

Item
{
    anchors.left: dayTitlesId.right
    anchors.top: dayTitlesId.top

    anchors.leftMargin: graphSidebarId.height / 14

    property var mondayBarWidth
    property var mondayBarText
    property var tuesdayBarWidth
    property var tuesdayBarText
    property var wednesdayBarWidth
    property var wednesdayBarText
    property var thursdayBarWidth
    property var thursdayBarText
    property var fridayBarWidth
    property var fridayBarText
    property var saturdayBarWidth
    property var saturdayBarText
    property var sundayBarWidth
    property var sundayBarText

    property int individualHeight : graphSidebarId.height / 28

    onVisibleChanged:
    {
        mondayBarId.width = mondayBarWidth
        mondayBarId.textContent = mondayBarText
        tuesdayBarId.width = tuesdayBarWidth
        tuesdayBarId.textContent = tuesdayBarText
        wednesdayBarId.width = wednesdayBarWidth
        wednesdayBarId.textContent = wednesdayBarText
        thursdayBarId.width = thursdayBarWidth
        thursdayBarId.textContent = thursdayBarText
        fridayBarId.width = fridayBarWidth
        fridayBarId.textContent = fridayBarText
        saturdayBarId.width = saturdayBarWidth
        saturdayBarId.textContent = saturdayBarText
        sundayBarId.width = sundayBarWidth
        sundayBarId.textContent = sundayBarText
    }

    GraphBar
    {
        id: mondayBarId
        width: mondayBarWidth
        height: individualHeight
        textContent: mondayBarText
        color: "orange"
        anchors.top: parent.top
        anchors.topMargin: imageSize / 9
    }

    GraphBar
    {
        id: tuesdayBarId
        width: tuesdayBarWidth
        height: individualHeight
        textContent: tuesdayBarText
        color: "orange"
        anchors.top: mondayBarId.bottom
        anchors.topMargin: imageSize / 15
    }

    GraphBar
    {
        id: wednesdayBarId
        width: wednesdayBarWidth
        height: individualHeight
        textContent: wednesdayBarText
        color: "orange"
        anchors.top: tuesdayBarId.bottom
        anchors.topMargin: imageSize / 15
    }

    GraphBar
    {
        id: thursdayBarId
        width: thursdayBarWidth
        height: individualHeight
        textContent: thursdayBarText
        color: "orange"
        anchors.top: wednesdayBarId.bottom
        anchors.topMargin: imageSize / 15
    }

    GraphBar
    {
        id: fridayBarId
        width: fridayBarWidth
        height: individualHeight
        textContent: fridayBarText
        color: "orange"
        anchors.top: thursdayBarId.bottom
        anchors.topMargin: imageSize / 15
    }

    GraphBar
    {
        id: saturdayBarId
        width: saturdayBarWidth
        height: individualHeight
        textContent: saturdayBarText
        color: "orange"
        anchors.top: fridayBarId.bottom
        anchors.topMargin: imageSize / 15
    }

    GraphBar
    {
        id: sundayBarId
        width: sundayBarWidth
        height: individualHeight
        textContent: sundayBarText
        color: "orange"
        anchors.top: saturdayBarId.bottom
        anchors.topMargin: imageSize / 15
    }
}
