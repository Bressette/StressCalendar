import QtQuick 2.0

Rectangle
{
    id: recentFeedbackRootId
    color: "white"

    property var textContent

    onVisibleChanged:
    {
        recentFeedbackContentId.text = textContent
    }

    Rectangle
    {
        id: recentFeedbackTitleContainerId
        width: parent.width / 2
        height: parent.height / 10
        color: "transparent"
        anchors.horizontalCenter: parent.horizontalCenter

        Text
        {
            id: recentFeedbackTitleId
            width: parent.width
            height: parent.height
            text: "Recent Feedback"
            font.pointSize: 100
            minimumPointSize: 10
            anchors.centerIn: parent
            fontSizeMode: Text.HorizontalFit
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
        }
    }

        Text
        {
            id: recentFeedbackContentId
            text: textContent
            width: parent.width - 10
            height: parent.height - 10 - recentFeedbackTitleContainerId.height
            anchors.top: recentFeedbackTitleContainerId.bottom
            anchors.left: parent.left
            anchors.topMargin: 5
            anchors.leftMargin: 5
            font.pointSize: parent.width / 30
            wrapMode: Text.Wrap
        }

        Rectangle
        {
            id: exitButtonId
            width: parent.height / 10
            height: width
            color: "red"
            anchors.top: parent.top
            anchors.right: parent.right

            Text
            {
                id: exitButtonXId
                width: parent.width
                height: parent.height
                text: "X"
                font.pointSize: 100
                minimumPointSize: 10
                anchors.centerIn: parent
                fontSizeMode: Text.Fit
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
            }
        }


}
