import QtQuick 2.0
import QtQuick.Layouts 1.3

ColumnLayout
{
    x: 0.02604 * graphSidebarId.width
    anchors.top: emoticonsColumnId.bottom
    anchors.topMargin: physcialActivityTitleId.implicitHeight

    property int textLayoutWidth
    property int textPointSize

    Text
    {
        id: mondayTextId
        Layout.preferredWidth: textLayoutWidth
        Layout.preferredHeight: Layout.preferredWidth

        text: qsTr("Mon")
        font.pointSize: textPointSize


    }

    Text
    {
        id: tuesdayTextId
        Layout.preferredWidth: textLayoutWidth
        Layout.preferredHeight: Layout.preferredWidth

        text: qsTr("Tues")
        font.pointSize: textPointSize
    }

    Text
    {
        id: wednesdayTextId
        Layout.preferredWidth: textLayoutWidth
        Layout.preferredHeight: Layout.preferredWidth

        text: qsTr("Wed")
        font.pointSize: textPointSize
    }

    Text
    {
        id: thursdayTextId
        Layout.preferredWidth: textLayoutWidth
        Layout.preferredHeight: Layout.preferredWidth

        text: qsTr("Thu")
        font.pointSize: textPointSize
    }

    Text
    {
        id: fridayTextId
        Layout.preferredWidth: textLayoutWidth
        Layout.preferredHeight: Layout.preferredWidth

        text: qsTr("Fri")
        font.pointSize: textPointSize
    }

    Text
    {
        id: saturdayTextId
        Layout.preferredWidth: textLayoutWidth
        Layout.preferredHeight: Layout.preferredWidth

        text: qsTr("Sat")
        font.pointSize: textPointSize
    }

    Text
    {

        id: sundayTextId
        Layout.preferredWidth: textLayoutWidth
        Layout.preferredHeight: Layout.preferredWidth

        text: qsTr("Sun")
        font.pointSize: textPointSize
    }
}
