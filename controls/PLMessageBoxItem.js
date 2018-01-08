//MessageBox窗体显示
var com = 0
function showMessageBox(parent, text, confirm_func) {
    com = Qt.createComponent("PLMessageBoxItem.qml");
    if(com.status === Component.Ready)
    {
        var messagebox = com.createObject(parent, {"anchors.fill":parent, "width": parent.width, "height": parent.height, "message": text});

        if (messagebox)
        {
            messagebox.confirmClicked.connect(confirm_func);
        }
        return messagebox;
    }
    else
    {
        console.log("创建MessageBox失败");
    }

    return 0;
}
