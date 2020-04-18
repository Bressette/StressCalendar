import QtQuick 2.0

//Item that contains the graph bars for the physical activity graph
Item
{
    //anchors the graph to the object that contains the titles of the days of the week
    anchors.left: dayTitlesId.right
    anchors.top: dayTitlesId.top

    anchors.leftMargin: graphSidebarId.height / 14

    //properties used to change the values of the graph bars
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

    //property used to control the height of all graph bars
    property int individualHeight : graphSidebarId.height / 28

    //event used to update the values when the visibility of the root element is changed
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

    //graph bar for monday
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

    //graph bar for tuesday
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

    //graph bar for wednesday
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

    //graph bar for thursday
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

    //graph bar for friday
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

    //graph bar for saturday
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

    //graph bar for sunday
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
