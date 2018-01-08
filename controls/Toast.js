//.pragma library

//Toast窗体显示
var com = 0
var toast = 0
function showToast(parent, text) {
    if(toast)
    {
        //console.log("Old toast --------------------");
        toast.parent = parent;
        toast.text = text;
        toast.show();
    }
    else
    {
        //console.log("New toast --------------------");
        com = Qt.createComponent("Toast.qml")
        if(com.status === Component.Ready)
        {
            console.log("Toast debug:", parent.width, parent.height);
            toast = com.createObject(parent, {"parent": parent, "anchors.centerIn":parent, "anchors.verticalCenterOffset": parent.height/3, "text": text})
        }
        else
        {
            console.log("创建Toast失败")
        }
    }

}
