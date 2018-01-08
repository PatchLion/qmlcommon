import QtQuick 2.0

Item {
    id: root_item
    width: 300
    height: 24

    property alias title: title_item.text
    property alias progress: progressBar.progress

    PLProgressBar {
        id: progressBar
        height: 10

        anchors.horizontalCenterOffset: 0
        anchors.verticalCenterOffset: 5
        progress: 0.0
        anchors.centerIn: parent
        width: parent.width
    }

    Text {
        color: "#ffffff"
        text: Math.round(root_item.progress*100) + "%"
        font.pixelSize: 8
        fontSizeMode: Text.Fit
        renderType: Text.NativeRendering
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignRight
        anchors.right: parent.right
        anchors.rightMargin: 2
        anchors.left: parent.left
        anchors.leftMargin: root_item.width/2
        anchors.top: parent.top
        anchors.topMargin: 2
    }
    Text {
        id: title_item

        color: "#ffffff"
        //text: "as"
        font.pixelSize: 8
        fontSizeMode: Text.Fit
        renderType: Text.NativeRendering
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignLeft
        anchors.right: parent.right
        anchors.rightMargin: root_item.width/2
        anchors.left: parent.left
        anchors.leftMargin: 2
        anchors.top: parent.top
        anchors.topMargin: 2
    }
}
