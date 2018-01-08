import QtQuick 2.0

Rectangle {

    id: bar_content_item
    property double progress: 0.0

    width: 300
    height: 12
    color: "#696969"
    radius: 5
    clip: true

    Rectangle {
        id: bar_rect
        width: bar_content_item.width * progress
        height: bar_content_item.height
        anchors.left: bar_content_item.left
        anchors.verticalCenter: bar_content_item.verticalCenter

        radius: bar_content_item.radius

        color: "#F0F0F0"
    }

    Rectangle{
        anchors.fill: parent

        border.color: "#F0F0F0"
        border.width: 1
        color:"transparent"
        radius: bar_content_item.radius

    }
}
