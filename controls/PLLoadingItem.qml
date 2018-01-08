import QtQuick 2.0

Item {
    width: 66
    height: 80

    property alias text: text_item.text

    AnimatedImage
    {
        id: image_item
        source: "qrc:/images/loading.gif"
        width: 44
        height: 44
        anchors.centerIn: parent
        anchors.verticalCenterOffset: -10
        antialiasing: true
    }

    Text
    {
        id: text_item
        color: "#ffffff"
        text: "Loading......"
        font.pixelSize: 10
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
        anchors.horizontalCenter: image_item.horizontalCenter
        anchors.top: image_item.bottom
        anchors.topMargin: 10
    }
}
