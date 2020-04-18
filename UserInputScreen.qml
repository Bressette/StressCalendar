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

    //properties used to change the value of UI elements on the UserInputScreen
    property bool joyCheckedVal
    property bool happyCheckedVal
    property bool sadCheckedVal
    property bool worriedCheckedVal
    property bool fearfulCheckedVal
    property bool angryCheckedVal
    property var physicalActivityTextFieldText
    property var notesTextAreaText
    property var day
    property var month
    property var year


    //Event used to update the UserInputScreen date text when the visibility of the root element is changed
    onVisibleChanged:
    {
        userInputDateTextId.text = month + "/" + day + "/" + year
    }


    //UI element that contains the emoticons with the text enabled
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

    //UI element that defines the radio buttons next to the emoticons
    RadioGroup
    {
        id: radioGroupId
    }


    //text element that contains the title text "Physical Activity(minutes)"
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


    //Text field used to allow the user to enter the amount of physical activity for the day
    TextField
    {
        id: physicalActivityInputTextFieldId
        width: physcialActivityInputId.implicitWidth
        height: graphSidebarId.height * 0.1
        anchors.top: physcialActivityInputId.bottom
        //validator that does not let the user enter any value that isn't an integer that is 0 or greater
        validator: IntValidator {bottom: 0;}
        font.pointSize: height / 3
        text: physicalActivityTextFieldText
    }

    //rectangle used to create a black line separator between the sidebar and the rest of the screen
    Rectangle
    {
        id: lineSeparatorRectId
        width: parent.width / 100
        height: parent.height
        color: "black"
        anchors.left: physcialActivityInputId.right
        anchors.leftMargin: 10
    }

        //UI element for the TextArea that lets users enter notes into a large text area
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

        //Title text that contains "Change Font Size" located at the bottom of the screen below the TextArea
        Text
        {
            id: changeFontTitleId
            width: rootId.width / 15
            height: rootId.height / 10
            anchors.top: notesTextAreaId.bottom
            anchors.topMargin: 5
            anchors.left: notesTextAreaId.left
            text: "Change Font Size"
            font.pointSize: 24
        }

        //TextField that when the user enters a value changes the font size of the TextArea
        TextField
        {
            id: changeFontTextFieldId
            width: rootId.width / 15
            height: rootId.height / 15
            anchors.top: changeFontTitleId.top
            x: changeFontTitleId.x + changeFontTextFieldId.implicitWidth - 50
            font.pointSize: 24
            text: notesTextAreaId.font.pointSize
            //validator that does not let the user enter any value that isn't an integer that is 0 or greater
            validator: IntValidator {bottom: 0;}

            //when the text is changed the font size of the TextArea is updated to the size of the entered value
            onTextChanged:
            {
                notesTextAreaId.font.pointSize = parseInt(text)
            }
        }



    //rectangle used to arrange the date text
    Rectangle
    {
        id: dateAlignmentRectId
        width: parent.width / 8
        height: parent.height / 15
        color: "transparent"
        anchors.left: previousDayButtonId.right
        anchors.leftMargin: previousDayButtonId.width / 4

        //Text that contains the current date and is fit to the dateAlignmentRect
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

    //UI element for the back to calendar button that contains the logic to move back to the CalendarScreen
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

                //insert the data into the database
                const notesVal = notesTextAreaId.text
                const radioButtonSelection = radioGroupId.getRadioButtonSelection()
                DB.insertDataTransaction(enterInputRectId.isoDate, radioButtonSelection, physicalActivityInputTextFieldId.text, notesVal)

                //update visibility to return to the calendar screen
                radioGroupId.visible = false
                radioGroupId.visible = true
                calendarScreenId.visible = true
                userInputScreenId.visible = false
                enterInputRectId.visible = false

                //set the graph values
                SetVals.setEmoticonValues()
                SetVals.setPhysicalActivityValues()

                //reset the visibility of the graphs to trigger the onVisibilityChanged event to update the values
                emoticonsGraphId.visible = false
                emoticonsGraphId.visible = true
                physicalActivityGraphId.visible = false
                physicalActivityGraphId.visible = true
            }
        }
    }


    //UI element for the previous day button that contains the logic to move to the previous day
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
                //inserts the data into the database
                const notesVal = notesTextAreaId.text
                const radioButtonSelection = radioGroupId.getRadioButtonSelection()
                DB.insertDataTransaction(enterInputRectId.isoDate, radioButtonSelection, physicalActivityInputTextFieldId.text, notesVal)

                //updates the date
                const date = new Date(enterInputRectId.year, enterInputRectId.month, enterInputRectId.day)
                date.setDate(date.getDate() - 1)
                enterInputRectId.day = date.getUTCDate()
                enterInputRectId.month = date.getUTCMonth()
                enterInputRectId.year = date.getUTCFullYear()

                //gets the new data and updates the values
                const isoDate = enterInputRectId.year + "-" + enterInputRectId.month + "-" + enterInputRectId.day
                DB.getDataForDate(isoDate)
                userInputDateTextId.text = enterInputRectId.month + "/" + enterInputRectId.day + "/" + enterInputRectId.year
                radioGroupId.visible = false
                radioGroupId.visible = true
            }
        }
    }

    //UI element for the next day button that contains the logic to move to the next day
    NavigationButton
    {
        id: nextDayButtonId
        buttonWidth: parent.width / 8
        buttonHeight: parent.height / 15
        buttonColor: "grey"
        anchors.left: backToCalendarButtonId.right
        anchors.leftMargin: (dateAlignmentRectId.x - previousDayButtonId.x) / 4
        textContent: "Next Day"

        MouseArea
        {
            anchors.fill: parent

            onClicked:
            {
                //inserts data into the database
                const notesVal = notesTextAreaId.text
                const radioButtonSelection = radioGroupId.getRadioButtonSelection()
                DB.insertDataTransaction(enterInputRectId.isoDate, radioButtonSelection, physicalActivityInputTextFieldId.text, notesVal)

                //updates the date to the next day
                const date = new Date(enterInputRectId.year, enterInputRectId.month, enterInputRectId.day)
                date.setDate(date.getDate() + 1)
                enterInputRectId.day = date.getUTCDate()
                enterInputRectId.month = date.getUTCMonth()
                enterInputRectId.year = date.getUTCFullYear()

                //get the values for the next day and set the UI element values
                const isoDate = enterInputRectId.year + "-" + enterInputRectId.month + "-" + enterInputRectId.day
                DB.getDataForDate(isoDate)
                userInputDateTextId.text = enterInputRectId.month + "/" + enterInputRectId.day + "/" + enterInputRectId.year
                radioGroupId.visible = false
                radioGroupId.visible = true

            }
        }


    }
}
