import QtQuick 2.0
import QtQuick.Layouts 1.4


ColumnLayout
{
    id: emoticonsColumnId
    x: 0.02604 * graphSidebarId.width
    anchors.top: alignmentRect.bottom

    property int imageSize

    property bool textEnabled
    property double textSize

    Image
    {
        id: joyId
        source: "emoticons/joy.png"
        Layout.preferredHeight: imageSize
        Layout.preferredWidth: Layout.preferredHeight
    }

    Text
    {
        id: joyTextId
        horizontalAlignment: Text.AlignHCenter
        text: qsTr("Joyful")
        color: "orange"
        font.pointSize: textSize
        Layout.leftMargin: 5
        visible: textEnabled

        style: Text.Outline
        styleColor: "black"
    }

    Image
    {
        id: happyId
        source: "emoticons/happy.png"
        Layout.preferredHeight: imageSize
        Layout.preferredWidth: Layout.preferredHeight
    }

    Text
    {
        id: happyTextId
        horizontalAlignment: Text.AlignHCenter
        text: qsTr("Happy")
        style: Text.Outline
        styleColor: "black"
        color: "yellow"
        font.pointSize: textSize
        Layout.leftMargin: 5
        visible: textEnabled
    }

    Image
    {
        id: sadId
        source: "emoticons/sad.png"
        Layout.preferredHeight: imageSize
        Layout.preferredWidth: Layout.preferredHeight
    }

    Text
    {
        id: sadTextId
        horizontalAlignment: Text.AlignHCenter
        text: qsTr("Sad")
        color: "blue"
        font.pointSize: textSize
        Layout.leftMargin: 5
        visible: textEnabled

        style: Text.Outline
        styleColor: "white"
    }

    Image
    {
        id: worryId
        source: "emoticons/worry.png"
        Layout.preferredHeight: imageSize
        Layout.preferredWidth: Layout.preferredHeight
    }

    Text
    {
        id: worriedTextId
        horizontalAlignment: Text.AlignHCenter
        text: qsTr("Worried")
        color: "cyan"
        font.pointSize: textSize
        Layout.leftMargin: 5
        visible: textEnabled

        style: Text.Outline
        styleColor: "black"
    }

    Image
    {
        id: fearfulId
        source: "emoticons/fearful.png"
        Layout.preferredHeight: imageSize
        Layout.preferredWidth: Layout.preferredHeight
    }

    Text
    {
        id: fearfulTextId
        horizontalAlignment: Text.AlignHCenter
        text: qsTr("Fearful")
        color: "purple"
        font.pointSize: textSize
        Layout.leftMargin: 5
        visible: textEnabled

        style: Text.Outline
        styleColor: "white"
    }

    Image
    {
        id: angerId
        source: "emoticons/anger.png"
        Layout.preferredHeight: imageSize
        Layout.preferredWidth: Layout.preferredHeight
    }

    Text
    {
        id: angryTextId
        horizontalAlignment: Text.AlignHCenter
        text: qsTr("Angry")
        color: "red"
        font.pointSize: textSize
        Layout.leftMargin: 5
        visible: textEnabled

        style: Text.Outline
        styleColor: "black"
    }

}
