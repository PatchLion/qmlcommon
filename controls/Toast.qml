import QtQuick 2.0

Rectangle {
    id: toast
    property alias text: toast_text.text
    width: toast_text.width + 40
    height: 36
    border.color: "#AAAAAA"
    radius: 8
    color: "#606060"

    z: 100000

    function show(){
        toast.visible = true;
        toast.opacity = 1.0;
        showTimer.running = true;
    }

    antialiasing: true
    TextWithDefaultFamily{
        id: toast_text
        anchors.centerIn: parent
        color: "#ffffff"
        text:"sdfsafsdfsfsd"
        font.pointSize: 10

    }

    Component.onCompleted: {
        showTimer.running = true
    }

    onOpacityChanged: {
        if(0 == opacity)
        {
            visible = false
            Component.deleteLater
        }
    }
    Timer{
        id: showTimer
        interval: 2000
        repeat: false
        running: false
        onTriggered: {
            opacity_ani.start()
        }
    }

    PropertyAnimation{id: opacity_ani; target: toast; properties: "opacity"; from: 1.0; to: 0.0; duration: 1000}
}
