import QtQuick 2.0

//rectangle that defines the root screen for recent feedback
Rectangle
{
    id: recentFeedbackRootId
    color: "white"

    //property used to allow for the body text of recent feedback to be updated
    property var textContent

    //update the recent feedback text based on the textContent property
    onVisibleChanged:
    {
        recentFeedbackContentId.text = textContent
    }

    //rectangle that defines the size of the recent feedback title
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

        //text that contains the feedback displayed to the user
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

        //rectangle that creates a red rectangle with an X fit to the size to let users know
        //that they should click to exit the recent feedback popup screen
        Rectangle
        {
            id: exitButtonId
            width: parent.height / 10
            height: width
            color: "red"
            anchors.top: parent.top
            anchors.right: parent.right

            //text that contains "X" and is fit to the size of the parent rectangle
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
