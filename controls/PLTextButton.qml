import QtQuick 2.0

PLButtonBase{
    property alias text: text_item.text

    property string textDefaultColor: "#999999"
    property string textPressedColor: "#999999"
    property string textHoverColor: "#999999"
    property string textDisabledColor: "#999999"

    property alias textFontFamliy: text_item.font.family
    property alias textPointSize: text_item.font.pointSize


    Text
    {
        id: text_item
        anchors.centerIn: parent
        //font.family: Configs.DefaultFontFamily
        verticalAlignment: Qt.AlignVCenter
        horizontalAlignment: Qt.AlignHCenter
        color: !enabled ? textDisabledColor :
                          (mouseArea.pressed ? textPressedColor :
                                                (mouseArea.containsMouse ? textHoverColor : textDefaultColor))

        font.pointSize: 12
        width: 0
        height: 0
    }
}
