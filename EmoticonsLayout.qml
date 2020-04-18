import QtQuick 2.0
import QtQuick.Layouts 1.4

//ColumnLayout that holds the images of all emoticons
ColumnLayout
{
    id: emoticonsColumnId
    x: 0.02604 * graphSidebarId.width
    anchors.top: alignmentRect.bottom

    //property that holds the imageSize that is used for every emoticon
    property int imageSize
    //property that determines if the names of the emoticons are displayed
    property bool textEnabled
    //property that determines the text size of the emoticon names
    property double textSize

    //Image object for the joy emoticon
    Image
    {
        id: joyId
        source: "emoticons/joy.png"
        Layout.preferredHeight: imageSize
        Layout.preferredWidth: Layout.preferredHeight
    }

    //Text object for the joy emoticon text
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

    //Image object for the happy emoticon
    Image
    {
        id: happyId
        source: "emoticons/happy.png"
        Layout.preferredHeight: imageSize
        Layout.preferredWidth: Layout.preferredHeight

    }

    //Text object for the happy emoticon text
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

    //Image object for the sad emoticon
    Image
    {
        id: sadId
        source: "emoticons/sad.png"
        Layout.preferredHeight: imageSize
        Layout.preferredWidth: Layout.preferredHeight
    }

    //Text object for the sad emoticon
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

    //Image object for the worry emoticon
    Image
    {
        id: worryId
        source: "emoticons/worry.png"
        Layout.preferredHeight: imageSize
        Layout.preferredWidth: Layout.preferredHeight
    }

    //Text object for the worry emoticon
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

    //Image object for the fearful emoticon
    Image
    {
        id: fearfulId
        source: "emoticons/fearful.png"
        Layout.preferredHeight: imageSize
        Layout.preferredWidth: Layout.preferredHeight
    }

    //Text object for the fearful emoticon
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

    //Image object for the anger emoticon
    Image
    {
        id: angerId
        source: "emoticons/anger.png"
        Layout.preferredHeight: imageSize
        Layout.preferredWidth: Layout.preferredHeight
    }

    //Text object for the anger emoticon
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
