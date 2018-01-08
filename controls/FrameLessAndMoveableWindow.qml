import QtQuick 2.9
import QtQuick.Window 2.3

Window {
    id: frameless_moveable_window
    flags: Qt.FramelessWindowHint | Qt.Window
    visibility: Window.Windowed
    color: "transparent"

    property var dragArea: Qt.rect(0, 0, width, height)

    Rectangle {
        id: move_rect
        x: frameless_moveable_window.dragArea.x
        y: frameless_moveable_window.dragArea.y
        width: frameless_moveable_window.dragArea.width
        height: frameless_moveable_window.dragArea.height

        color: "transparent"

        property point startPoint: Qt.point(0, 0)
        property point offsetPoint: Qt.point(0, 0)
        property bool isMoveWindow: false

        MouseArea {
            id: moveArea
            anchors.fill: parent
            onPressed: {
                cursorShape = Qt.ClosedHandCursor;
                move_rect.startPoint = Qt.point(mouseX, mouseY);
                move_rect.isMoveWindow = true;
            }
            onPositionChanged: {
                move_rect.offsetPoint = Qt.point(mouseX - move_rect.startPoint.x,
                                                  mouseY - move_rect.startPoint.y);
                if(true == move_rect.isMoveWindow)
                {
                    frameless_moveable_window.x = frameless_moveable_window.x + move_rect.offsetPoint.x;
                    frameless_moveable_window.y = frameless_moveable_window.y + move_rect.offsetPoint.y;
                }
            }
            onReleased: {
                cursorShape = Qt.ArrowCursor;
                move_rect.isMoveWindow = false;
            }

            onDoubleClicked: {
                console.log(frameless_moveable_window.visibility)
                if (frameless_moveable_window.visibility==Window.Windowed)
                {

                    frameless_moveable_window.visibility = Window.Maximized
                }
                else if (frameless_moveable_window.visibility==Window.Maximized)
                {

                    frameless_moveable_window.visibility = Window.Windowed
                }
            }
        }
    }

}
