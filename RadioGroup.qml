import QtQuick 2.12
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4
import QtQuick.Layouts 1.3


ColumnLayout
{
    anchors.left: emoticonsInputLayoutId.right
    property var joyChecked
    property var happyChecked
    property var sadChecked
    property var worriedChecked
    property var fearfulChecked
    property var angryChecked


    RadioButton
    {
        id: joyRadioButtonId
        Layout.topMargin: emoticonsInputLayoutId.imageSize / 3
        Layout.bottomMargin: emoticonsInputLayoutId.imageSize / 2
        checked: joyChecked

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

        checked: happyChecked

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
        checked: sadChecked

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
        checked: worriedChecked

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
        checked: fearfulChecked

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
        checked: angryChecked

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
