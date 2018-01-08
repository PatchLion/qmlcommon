import QtQuick 2.6
import QtQuick.Window 2.2
import "./controls"
import "./controls/PLCoverPanel.js" as CoverPanel
import "./controls/PLMessageBoxItem.js" as MessageBox
import "./controls/PLToast.js" as Toast

Window {
    id: root_window
    visible: true
    width: 800
    height: 600
    title: qsTr("QML 通用控件")

    PLImageButtonItem{
        id: image_closebutton
        width: 24
        height: 24
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.rightMargin: 5
        anchors.topMargin: 5

        defaultIcon: "qrc:/images/button_24_0_2.png"
        pressedIcon: "qrc:/images/button_24_0_1.png"
        hoverIcon: "qrc:/images/button_24_0_1.png"
        disableIcon: "qrc:/images/button_24_0_0.png"

        onClicked: {
            Qt.quit();
        }
    }

    PLTextButton{

        width: 40
        height: 24
        anchors.right: image_closebutton.left
        anchors.top: parent.top
        anchors.rightMargin: 5
        anchors.topMargin: 5

        textPointSize: 9

        defaultColor: "transparent"
        hoverColor: "transparent"
        pressedColor: "transparent"
        disabledColor: "transparent"

        textDefaultColor: "#ff0000"
        textPressedColor: "#000066"
        textHoverColor: "#004400"
        textDisabledColor: "#990000"

        text: "关闭"

        onClicked: {
            Qt.quit();
        }
    }

    Flickable{
        anchors.fill: parent
        anchors.margins: 5
        anchors.topMargin: 40
        //contentWidth: parent.width
        contentHeight: 1000
        boundsBehavior: Flickable.StopAtBounds
        clip: true

        Column{
            id: content_item
            spacing: 5



            anchors.fill: parent


            ExampleRow{
                text: "Check Button"

                PLCheckButtonGroup{
                    buttons: [checkbuttonbase, textcheckbutton, imagecheckbutton]
                }

                PLCheckButtonBase{
                    id: checkbuttonbase
                    width: 90
                    height: 26
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.left: parent.left
                    anchors.leftMargin: 10
                    radius: 10


                }

                PLCheckTextButton{
                    id: textcheckbutton
                    text: "Text Checkbutton"
                    textFontFamliy: "微软雅黑"
                    width: 160
                    height: 26
                    textPointSize: 9
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.left: checkbuttonbase.right
                    anchors.leftMargin: 10
                    radius: 10
                }

                PLImageCheckButtonItem{
                    id: imagecheckbutton
                    width: 90
                    height: 26
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.left: textcheckbutton.right
                    anchors.leftMargin: 10
                    radius: 10

                    defaultIcon: "qrc:/images/btn_default.png"
                    pressedIcon: "qrc:/images/btn_pressed.png"
                    hoverIcon: "qrc:/images/btn_hover.png"
                    disableIcon: "qrc:/images/btn_default.png"
                }
            }


            ExampleRow{
                id: loadingcoverpanel
                text: "Loading Cover Panel"

                height: 280

                Component.onCompleted: {
                    CoverPanel.showLoadingCover(loadingcoverpanel, "加载中")
                }
            }

            ExampleRow{
                id: progresscoverpanel
                text: "Progress Cover Panel"

                height: 280

                Component.onCompleted: {
                    var cover = CoverPanel.showProgressBarCover(progresscoverpanel)
                    CoverPanel.setProgressBarCoverTooltip(cover, "测试过程")
                    CoverPanel.setProgressBarCoverProgress(cover, 0.66)
                }
            }

            ExampleRow{
                id: messageboxpanel

                text: "MessageBox"

                PLTextButton{
                    anchors.centerIn: parent
                    width: 160
                    height: 40
                    text: "显示MessageBox"
                    onClicked: {
                        var messagebox = MessageBox.showMessageBox(root_window, "Messagebox Test", function(){
                            messagebox.visible = false;
                            messagebox.destroy();
                            console.log("Messagebox OK button clicked!");
                        });
                    }
                }
            }
            ExampleRow{
                id: buttons

                text: "buttons"

                PLImageButtonItem{
                    id: imagebutton_item
                    defaultIcon: "qrc:/images/btn_default.png"
                    pressedIcon: "qrc:/images/btn_pressed.png"
                    hoverIcon: "qrc:/images/btn_hover.png"
                    disableIcon: "qrc:/images/btn_default.png"
                    width: 90
                    height: 26

                    anchors.verticalCenter: parent.verticalCenter
                    anchors.left: parent.left
                    anchors.leftMargin: 10
                }

                PLButtonBase{
                    id: normalbutton_item

                    width: 90
                    height: 26

                    anchors.verticalCenter: parent.verticalCenter
                    anchors.left: imagebutton_item.right
                    anchors.leftMargin: 10
                }

            }
            ExampleRow{
                id: progres_panel

                text: "ProgressBar"

                PLProgressBar{
                    anchors.centerIn: parent
                    progress: 0.55

                    width: parent.width * 3 / 5

                }

            }
            ExampleRow{
                id: toast_item

                text: "Toast"

                PLTextButton{
                    anchors.centerIn: parent
                    width: 160
                    height: 40
                    text: "显示Toast"
                    onClicked: {
                        var toast = Toast.showToast(root_window, "Toast Test!!!!!!!!!!!!!!!!!!!");
                    }
                }
            }
        }
    }



}
