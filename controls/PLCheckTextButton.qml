import QtQuick 2.0

PLCheckButtonBase{
    property alias text: text_item.text

    property string textDefaultColor: "#828282"
    property string textPressedColor: "#262626"
    property string textHoverColor: "#666666"
    property string textDisabledColor: "#161616"

    property alias textFontFamliy: text_item.font.family
    property alias textPointSize: text_item.font.pointSize


    Text
    {
        id: text_item
        anchors.centerIn: parent
        verticalAlignment: Qt.AlignVCenter
        horizontalAlignment: Qt.AlignHCenter
        color:!enabled ? textDisabledColor :
                         (isChecked ? textPressedColor : textDefaultColor)

        font.pointSize: 12
    }
}
