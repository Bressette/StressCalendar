import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4
import QtQuick.Layouts 1.3
import QtQuick.LocalStorage 2.12

import "DatabaseFunctions.js" as DB
import "SetUIValues.js" as SetVals

Rectangle
{
    id: userInputScreenId
    anchors.fill: parent
    visible: false

    property bool joyCheckedVal : false
    property bool happyCheckedVal : false
    property bool sadCheckedVal : false
    property bool worriedCheckedVal : false
    property bool fearfulCheckedVal : false
    property bool angryCheckedVal : false

    property var physicalActivityTextFieldText
    property var notesTextAreaText

    property var day
    property var month
    property var year



    onVisibleChanged: {
        userInputDateTextId.text = month + "/" + day + "/" + year
    }


    EmoticonsLayout
    {
        id: emoticonsInputLayoutId
        imageSize : graphSidebarId.height / 11
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.leftMargin: 5
        textEnabled: true

        textSize: graphSidebarId.height / 50
    }


    RadioGroup
    {
        id: radioGroupId
    }


    Text
    {
        id: physcialActivityInputId
        width: moodTitleId.width
        anchors.top: emoticonsInputLayoutId.bottom
        anchors.left: parent.left


        text: qsTr("Physical Activity(minutes)")
        font.pointSize: moodTitleId.font.pointSize / 2
        wrapMode: Text.WordWrap
    }



    TextField
    {
        id: physicalActivityInputTextFieldId
        width: physcialActivityInputId.implicitWidth
        height: graphSidebarId.height * 0.1
        anchors.top: physcialActivityInputId.bottom
        validator: IntValidator {bottom: 0;}
        font.pointSize: height / 3
        text: physicalActivityTextFieldText
    }

    Rectangle
    {
        id: lineSeparatorRectId
        width: parent.width / 100
        height: parent.height
        color: "black"
        anchors.left: physcialActivityInputId.right
        anchors.leftMargin: 10
    }


    NavigationButton
    {
        id: previousDayButtonId
        buttonWidth: parent.width / 8
        buttonHeight: parent.height / 15
        buttonColor: "grey"
        anchors.left: lineSeparatorRectId.right
        anchors.leftMargin: 5
        textContent: "Previous Day"

        MouseArea
        {
            anchors.fill: parent

            onClicked:
            {
                DB.insertDataTransaction(enterInputRectId.isoDate, SetVals.getRadioButtonSelection(), physicalActivityInputTextFieldId.text, "Hello")

                const date = new Date(enterInputRectId.year, enterInputRectId.month, enterInputRectId.day)
                date.setDate(date.getDate() - 1)
                enterInputRectId.day = date.getUTCDate()
                enterInputRectId.month = date.getUTCMonth()
                enterInputRectId.year = date.getUTCFullYear()

                const isoDate = enterInputRectId.year + "-" + enterInputRectId.month + "-" + enterInputRectId.day
                DB.getDataForDate(isoDate)
                userInputDateTextId.text = enterInputRectId.month + "/" + enterInputRectId.day + "/" + enterInputRectId.year
                radioGroupId.visible = false
                radioGroupId.visible = true

                console.log("Populate fields with data from previous day")
            }
        }
    }







        TextArea
        {
            id: notesTextAreaId
            width: rootId.width - lineSeparatorRectId.x * 1.2
            height: rootId.height - previousDayButtonId.height * 2.5
            anchors.top: previousDayButtonId.bottom
            anchors.topMargin: 10
            anchors.left: lineSeparatorRectId.right
            anchors.leftMargin: 5
            text: notesTextAreaText
            font.pointSize: 10
        }





    Rectangle
    {
        id: dateAlignmentRectId
        width: parent.width / 8
        height: parent.height / 15
        color: "transparent"
        anchors.left: previousDayButtonId.right
        anchors.leftMargin: previousDayButtonId.width / 4

        Text
        {
            id: userInputDateTextId
            width: parent.width
            height: parent.height


            text: month + "/" + day + "/" + year
            anchors.centerIn: parent
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            font.pointSize: 100
            minimumPointSize: 10
            fontSizeMode: Text.HorizontalFit

        }
    }


    NavigationButton
    {
        id: backToCalendarButtonId

        buttonWidth: parent.width / 5
        buttonHeight: parent.height / 15
        buttonColor: "grey"
        textContent: "Back to Calendar"

        anchors.left: dateAlignmentRectId.right
        anchors.leftMargin: (dateAlignmentRectId.x - previousDayButtonId.x) / 4

        MouseArea
        {
            anchors.fill: parent

            onClicked:
            {

                DB.insertDataTransaction(enterInputRectId.isoDate, SetVals.getRadioButtonSelection(), physicalActivityInputTextFieldId.text, "Hello")
                radioGroupId.visible = false
                radioGroupId.visible = true
                calendarScreenId.visible = true
                userInputScreenId.visible = false
                enterInputRectId.visible = false


                console.log("Switch back to the calendar screen")
            }
        }
    }


    NavigationButton
    {
        id: nextDayButtonId
        buttonWidth: parent.width / 8
        buttonHeight: parent.height / 15
        buttonColor: "grey"
        anchors.left: backToCalendarButtonId.right
        anchors.leftMargin: (dateAlignmentRectId.x - previousDayButtonId.x) / 4

        MouseArea
        {
            anchors.fill: parent

            onClicked:
            {

                const physicalActivityNumber = parseInt(physicalActivityInputTextFieldId.text)

                DB.insertDataTransaction(enterInputRectId.isoDate, SetVals.getRadioButtonSelection(), physicalActivityInputTextFieldId.text, "Hello")




                const date = new Date(enterInputRectId.year, enterInputRectId.month, enterInputRectId.day)
                date.setDate(date.getDate() + 1)
                enterInputRectId.day = date.getUTCDate()
                enterInputRectId.month = date.getUTCMonth()
                enterInputRectId.year = date.getUTCFullYear()

                const isoDate = enterInputRectId.year + "-" + enterInputRectId.month + "-" + enterInputRectId.day

                DB.getDataForDate(isoDate)
                userInputDateTextId.text = enterInputRectId.month + "/" + enterInputRectId.day + "/" + enterInputRectId.year
                radioGroupId.visible = false
                radioGroupId.visible = true

            }
        }

        textContent: "Next Day"
    }
}
