import QtQuick 2.12
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4
import QtQuick.Layouts 1.3

//column layout that contains all radio buttons
ColumnLayout
{
    anchors.left: emoticonsInputLayoutId.right

    //update the values of the radio buttons when the visibility of RadioGroup changes
    onVisibleChanged:
    {
        joyRadioButtonId.checked = userInputScreenId.joyCheckedVal
        happyRadioButtonId.checked = userInputScreenId.happyCheckedVal
        sadRadioButtonId.checked = userInputScreenId.sadCheckedVal
        worriedRadioButtonId.checked = userInputScreenId.worriedCheckedVal
        fearfulRadioButtonId.checked = userInputScreenId.fearfulCheckedVal
        angryRadioButtonId.checked = userInputScreenId.angryCheckedVal
    }

    //returns a value for the radio button that is selected
    function getRadioButtonSelection()
    {
        if(joyRadioButtonId.checked === true)
            return 0
        else if(happyRadioButtonId.checked === true)
            return 1
        else if(sadRadioButtonId.checked === true)
            return 2
        else if(worriedRadioButtonId.checked === true)
            return 3
        else if(fearfulRadioButtonId.checked === true)
            return 4
        else if(angryRadioButtonId.checked === true)
            return 5
        else
            return 6
    }

    //radio button for the joy emoticon
    RadioButton
    {
        id: joyRadioButtonId
        Layout.topMargin: emoticonsInputLayoutId.imageSize / 3
        Layout.bottomMargin: emoticonsInputLayoutId.imageSize / 2
        checked: userInputScreenId.joyCheckedVal

        //create a style for the radio button that allows for resizing
        style: RadioButtonStyle {
                indicator: Rectangle {
                        implicitWidth: emoticonsInputLayoutId.imageSize / 2
                        implicitHeight: emoticonsInputLayoutId.imageSize / 2
                        radius: implicitHeight / 2
                        border.color: control.activeFocus ? "darkblue" : "gray"
                        border.width: 1
                        Rectangle {
                            anchors.fill: parent
                            visible: control.checked
                            color: "#555"
                            radius: parent.radius
                            anchors.margins: 4
                        }
                }
        }


        //sets the values of all other radio buttons to false when the radio button is selected
        onCheckedChanged: {
            if(checked === true)
            {
                happyRadioButtonId.checked = false
                sadRadioButtonId.checked = false
                worriedRadioButtonId.checked = false
                fearfulRadioButtonId.checked = false
                angryRadioButtonId.checked = false
            }
        }
    }

    //radio button for the happy emoticon
    RadioButton
    {
        id: happyRadioButtonId

        checked: userInputObjectId.happyCheckedVal

        //creates a style for the radio button that allows for resizing
        style: RadioButtonStyle {
                indicator: Rectangle {
                        implicitWidth: emoticonsInputLayoutId.imageSize / 2
                        implicitHeight: emoticonsInputLayoutId.imageSize / 2
                        radius: implicitHeight / 2
                        border.color: control.activeFocus ? "darkblue" : "gray"
                        border.width: 1
                        Rectangle {
                            anchors.fill: parent
                            visible: control.checked
                            color: "#555"
                            radius: parent.radius
                            anchors.margins: 4
                        }
                }
        }


        Layout.topMargin: emoticonsInputLayoutId.imageSize / 2.5
        Layout.bottomMargin: emoticonsInputLayoutId.imageSize / 2

        //sets the values of all other radio buttons to false when the radio button is selected
        onCheckedChanged: {
            if(checked === true)
            {
                joyRadioButtonId.checked = false
                sadRadioButtonId.checked = false
                worriedRadioButtonId.checked = false
                fearfulRadioButtonId.checked = false
                angryRadioButtonId.checked = false
            }
        }
    }

    //radio button for the sad emoticon
    RadioButton
    {
        id: sadRadioButtonId
        checked: userInputObjectId.sadCheckedVal

        //creates a style for the radio button that allows for resizing
        style: RadioButtonStyle {
                indicator: Rectangle {
                        implicitWidth: emoticonsInputLayoutId.imageSize / 2
                        implicitHeight: emoticonsInputLayoutId.imageSize / 2
                        radius: implicitHeight / 2
                        border.color: control.activeFocus ? "darkblue" : "gray"
                        border.width: 1
                        Rectangle {
                            anchors.fill: parent
                            visible: control.checked
                            color: "#555"
                            radius: parent.radius
                            anchors.margins: 4
                        }
                }
        }


        Layout.topMargin: emoticonsInputLayoutId.imageSize / 2.5
        Layout.bottomMargin: emoticonsInputLayoutId.imageSize / 2

        //sets the values of all other radio buttons to false when the radio button is selected
        onCheckedChanged: {
            if(checked === true)
            {
                joyRadioButtonId.checked = false
                happyRadioButtonId.checked = false
                worriedRadioButtonId.checked = false
                fearfulRadioButtonId.checked = false
                angryRadioButtonId.checked = false
            }
        }
    }

    //radio button for the worried emoticon
    RadioButton
    {
        id: worriedRadioButtonId
        checked: userInputObjectId.worriedCheckedVal

        //creates a style for the radio button that allows for resizing
        style: RadioButtonStyle {
                indicator: Rectangle {
                        implicitWidth: emoticonsInputLayoutId.imageSize / 2
                        implicitHeight: emoticonsInputLayoutId.imageSize / 2
                        radius: implicitHeight / 2
                        border.color: control.activeFocus ? "darkblue" : "gray"
                        border.width: 1
                        Rectangle {
                            anchors.fill: parent
                            visible: control.checked
                            color: "#555"
                            radius: parent.radius
                            anchors.margins: 4
                        }
                }
        }

        Layout.topMargin: emoticonsInputLayoutId.imageSize / 2.5
        Layout.bottomMargin: emoticonsInputLayoutId.imageSize / 2

        //sets the values of all other radio buttons to false when the radio button is selected
        onCheckedChanged: {
            if(checked === true)
            {
                joyRadioButtonId.checked = false
                sadRadioButtonId.checked = false
                happyRadioButtonId.checked = false
                fearfulRadioButtonId.checked = false
                angryRadioButtonId.checked = false
            }
        }
    }

    //radio button for the fearful emoticon
    RadioButton
    {
        id: fearfulRadioButtonId
        checked: userInputObjectId.fearfulCheckedVal

        //creates a style for the radio button that allows for resizing
        style: RadioButtonStyle {
                indicator: Rectangle {
                        implicitWidth: emoticonsInputLayoutId.imageSize / 2
                        implicitHeight: emoticonsInputLayoutId.imageSize / 2
                        radius: implicitHeight / 2
                        border.color: control.activeFocus ? "darkblue" : "gray"
                        border.width: 1
                        Rectangle {
                            anchors.fill: parent
                            visible: control.checked
                            color: "#555"
                            radius: parent.radius
                            anchors.margins: 4
                        }
                }
        }

        Layout.topMargin: emoticonsInputLayoutId.imageSize / 2.5
        Layout.bottomMargin: emoticonsInputLayoutId.imageSize / 2

        //sets the values of all other radio buttons to false when the radio button is selected
        onCheckedChanged: {
            if(checked === true)
            {
                joyRadioButtonId.checked = false
                sadRadioButtonId.checked = false
                happyRadioButtonId.checked = false
                worriedRadioButtonId.checked = false
                angryRadioButtonId.checked = false
            }
        }
    }

    //radio button for the angry emoticon
    RadioButton
    {
        id: angryRadioButtonId
        checked: userInputObjectId.angryCheckedVal

        //creates a style for the radio button that allows for resizing
        style: RadioButtonStyle {
                indicator: Rectangle {
                        implicitWidth: emoticonsInputLayoutId.imageSize / 2
                        implicitHeight: emoticonsInputLayoutId.imageSize / 2
                        radius: implicitHeight / 2
                        border.color: control.activeFocus ? "darkblue" : "gray"
                        border.width: 1
                        Rectangle {
                            anchors.fill: parent
                            visible: control.checked
                            color: "#555"
                            radius: parent.radius
                            anchors.margins: 4
                        }
                }
        }

        Layout.topMargin: emoticonsInputLayoutId.imageSize / 2.5
        Layout.bottomMargin: emoticonsInputLayoutId.imageSize / 2

        //sets the values of all other radio buttons to false when the radio button is selected
        onCheckedChanged: {
            if(checked === true)
            {
                joyRadioButtonId.checked = false
                sadRadioButtonId.checked = false
                happyRadioButtonId.checked = false
                worriedRadioButtonId.checked = false
                fearfulRadioButtonId.checked = false
            }
        }
    }
}
