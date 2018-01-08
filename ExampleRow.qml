import QtQuick 2.0

Rectangle {
    property alias text: text_item.text
    //property alias contentItem: content_item

    color: "#D3D3D3"
    border.color: "#333333"
    radius: 5
    width: parent.width
    height: 80

    smooth: true

    Text{
        id: text_item

        color: "#191970"
        font.bold: true
        font.pixelSize: 20

        font.family: "微软雅黑"

        anchors.right: parent.right
        anchors.rightMargin: 5
        anchors.verticalCenter: parent.verticalCenter

        verticalAlignment: Qt.AlignVCenter
        horizontalAlignment: Qt.AlignLeft


        height: 16
    }
}
