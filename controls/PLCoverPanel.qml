import QtQuick 2.0

Rectangle {
    id: loading_cover


    color: "#33000000"

    property int type: 1 //0: loadding 1: progressbar
    property string text: ""
    property alias progress: progress_tooltip_bar.progress

    PLLoadingItem{
        id: loading_item
        anchors.centerIn: parent
        anchors.verticalCenterOffset: parent.height / 4
        visible: 0 === type

        text: loading_cover.text
    }

    PLProgressTooltipPanel{
        id: progress_tooltip_bar

        title: loading_cover.text

        anchors.centerIn: parent

        width: parent.width *3 /5
        height: 30

        anchors.verticalCenterOffset: parent.height / 4
        visible: 1 === type
    }

    MouseArea{
        anchors.fill: parent
        hoverEnabled: true
    }
}
