//.pragma library

//Toast窗体显示
var com = 0
function showToast(parent, text) {
    //console.log("New toast --------------------");
    com = Qt.createComponent("PLToast.qml")
    if(com.status === Component.Ready)
    {
        //console.log("Toast debug:", parent.width, parent.height);
        com.createObject(parent, {"parent": parent,
                                     "width":parent.width,
                                     "height":parent.height,
                                     "text": text})
    }
    else
    {
        console.log("创建Toast失败:", com.status, com.errorString())
    }
}
