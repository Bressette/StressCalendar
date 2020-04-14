import QtQuick 2.0
import QtQuick.Layouts 1.4


ColumnLayout
{
    id: emoticonsColumnId
    x: 0.02604 * graphSidebarId.width
    anchors.top: alignmentRect.bottom

    property int imageSize

    Image
    {
        id: joyId
        source: "emoticons/joy.png"
        Layout.preferredHeight: imageSize
        Layout.preferredWidth: Layout.preferredHeight


    }

    Image
    {
        id: happyId
        source: "emoticons/happy.png"
        Layout.preferredHeight: imageSize
        Layout.preferredWidth: Layout.preferredHeight
    }

    Image
    {
        id: sadId
        source: "emoticons/sad.png"
        Layout.preferredHeight: imageSize
        Layout.preferredWidth: Layout.preferredHeight
    }

    Image
    {
        id: worryId
        source: "emoticons/worry.png"
        Layout.preferredHeight: imageSize
        Layout.preferredWidth: Layout.preferredHeight
    }

    Image
    {
        id: fearfulId
        source: "emoticons/fearful.png"
        Layout.preferredHeight: imageSize
        Layout.preferredWidth: Layout.preferredHeight
    }

    Image
    {
        id: angerId
        source: "emoticons/anger.png"
        Layout.preferredHeight: imageSize
        Layout.preferredWidth: Layout.preferredHeight
    }


}
