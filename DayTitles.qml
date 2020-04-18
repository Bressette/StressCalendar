import QtQuick 2.0
import QtQuick.Layouts 1.3

ColumnLayout
{

    //properties used to edit width and font size
    property int textLayoutWidth
    property int textPointSize

    //text object for mondy
    Text
    {
        id: mondayTextId
        Layout.preferredWidth: textLayoutWidth
        Layout.preferredHeight: Layout.preferredWidth

        text: qsTr("Mon")
        font.pointSize: textPointSize
    }

    //text object for tuesday
    Text
    {
        id: tuesdayTextId
        Layout.preferredWidth: textLayoutWidth
        Layout.preferredHeight: Layout.preferredWidth

        text: qsTr("Tues")
        font.pointSize: textPointSize
    }

    //text object for wednesday
    Text
    {
        id: wednesdayTextId
        Layout.preferredWidth: textLayoutWidth
        Layout.preferredHeight: Layout.preferredWidth

        text: qsTr("Wed")
        font.pointSize: textPointSize
    }

    //text object for thursday
    Text
    {
        id: thursdayTextId
        Layout.preferredWidth: textLayoutWidth
        Layout.preferredHeight: Layout.preferredWidth

        text: qsTr("Thu")
        font.pointSize: textPointSize
    }

    //text object for friday
    Text
    {
        id: fridayTextId
        Layout.preferredWidth: textLayoutWidth
        Layout.preferredHeight: Layout.preferredWidth

        text: qsTr("Fri")
        font.pointSize: textPointSize
    }

    //text object for saturday
    Text
    {
        id: saturdayTextId
        Layout.preferredWidth: textLayoutWidth
        Layout.preferredHeight: Layout.preferredWidth

        text: qsTr("Sat")
        font.pointSize: textPointSize
    }

    //text object for sunday
    Text
    {
        id: sundayTextId
        Layout.preferredWidth: textLayoutWidth
        Layout.preferredHeight: Layout.preferredWidth

        text: qsTr("Sun")
        font.pointSize: textPointSize
    }
}
