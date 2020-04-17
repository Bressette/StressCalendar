import QtQuick 2.12
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4
import QtQuick.Layouts 1.3


ColumnLayout
{
    anchors.left: emoticonsInputLayoutId.right


    onVisibleChanged: {
        joyRadioButtonId.checked = userInputScreenId.joyCheckedVal
        happyRadioButtonId.checked = userInputScreenId.happyCheckedVal
        sadRadioButtonId.checked = userInputScreenId.sadCheckedVal
        worriedRadioButtonId.checked = userInputScreenId.worriedCheckedVal
        fearfulRadioButtonId.checked = userInputScreenId.fearfulCheckedVal
        angryRadioButtonId.checked = userInputScreenId.angryCheckedVal
    }

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

    RadioButton
    {
        id: joyRadioButtonId
        Layout.topMargin: emoticonsInputLayoutId.imageSize / 3
        Layout.bottomMargin: emoticonsInputLayoutId.imageSize / 2
        checked: userInputScreenId.joyCheckedVal

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

    RadioButton
    {
        id: happyRadioButtonId

        checked: userInputObjectId.happyCheckedVal

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

    RadioButton
    {
        id: sadRadioButtonId
        checked: userInputObjectId.sadCheckedVal

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

    RadioButton
    {
        id: worriedRadioButtonId
        checked: userInputObjectId.worriedCheckedVal

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

    RadioButton
    {
        id: fearfulRadioButtonId
        checked: userInputObjectId.fearfulCheckedVal

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

    RadioButton
    {
        id: angryRadioButtonId
        checked: userInputObjectId.angryCheckedVal

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
