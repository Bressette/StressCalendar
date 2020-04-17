import QtQuick 2.12
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4
import QtQuick.Layouts 1.3


ColumnLayout
{
    anchors.left: emoticonsInputLayoutId.right


    onVisibleChanged: {
        joyRadioButtonId.checked = joyCheckedVal
        happyRadioButtonId.checked = happyCheckedVal
        sadRadioButtonId.checked = sadCheckedVal
        worriedRadioButtonId.checked = worriedCheckedVal
        fearfulRadioButtonId.checked = fearfulCheckedVal
        angryRadioButtonId.checked = angryCheckedVal
    }

    RadioButton
    {
        id: joyRadioButtonId
        Layout.topMargin: emoticonsInputLayoutId.imageSize / 3
        Layout.bottomMargin: emoticonsInputLayoutId.imageSize / 2
        checked: joyCheckedVal

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

        checked: happyCheckedVal

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
        checked: sadCheckedVal

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
        checked: worriedCheckedVal

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
        checked: fearfulCheckedVal

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
        checked: angryCheckedVal

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
