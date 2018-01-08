import QtQuick 2.0
Rectangle{
    id: toast_item

    property alias text: toast_text.text

    z: 100000

    antialiasing: true
    smooth: true

    color: "transparent"

    Rectangle {
        id: toast
        width: toast_text.width + 40
        height: 36
        border.color: "#AAAAAA"
        radius: 8
        color: "#606060"

        anchors.centerIn: parent
        anchors.verticalCenterOffset: parent.height / 4

        smooth: true

        function show(){
            toast.visible = true;
            toast.opacity = 1.0;
            showTimer.running = true;
        }

        Text{
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
                toast_item.visible = false
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
}

