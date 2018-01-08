import QtQuick 2.0

Rectangle{
    id: root_item

    property alias mouseArea: mouse_area
    signal clicked()

    property string defaultColor: "#F0F8FF"
    property string hoverColor: "#E6E6FA"
    property string pressedColor: "#778899"
    property string disabledColor: "#8B8989"

    property string defaultBorderColor: "transparent"
    property string hoverBorderColor: "transparent"
    property string pressedBorderColor: "transparent"
    property string disabledBorderColor: "transparent"

    radius: 5

    color: !enabled ? disabledColor :
                      (mouse_area.pressed ? pressedColor :
                                            (mouse_area.containsMouse ? hoverColor : defaultColor))

    border.color: !enabled ? disabledBorderColor :
                             (mouse_area.pressed ? pressedBorderColor :
                                                   (mouse_area.containsMouse ? hoverBorderColor : defaultBorderColor))


    MouseArea{
        id: mouse_area
        z: 99999
        anchors.fill: parent
        hoverEnabled: true
        cursorShape: Qt.PointingHandCursor
        onClicked: {emit: root_item.clicked()}
    }
}
