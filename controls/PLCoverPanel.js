//.pragma library

//带Loadding遮罩窗体显示
var com = 0
function showLoadingCover(parent, text) {
    if (0 === com) {
        com = Qt.createComponent("PLCoverPanel.qml")
    }

    if (com.status === Component.Ready) {
        var cover = com.createObject(parent, {
                                         "anchors.fill": parent,
                                         "width": parent.width,
                                         "height": parent.height,
                                         "text": text,
                                         "type": 0
                                     });
        return cover;
    } else {
        console.log("创建CoverPanel失败")
    }

    return 0;
}

//带进度条遮罩窗体显示
function showProgressBarCover(parent){
    if (0 === com) {
        com = Qt.createComponent("PLCoverPanel.qml")
    }

    if (com.status === Component.Ready) {
        var cover = com.createObject(parent, {
                                         "anchors.fill": parent,
                                         "width": parent.width,
                                         "height": parent.height,
                                         "type": 1
                                     });
        return cover;
    } else {
        console.log("创建CoverPanel失败")
    }

    return 0;
}

//设置进度条遮罩提示文字
function setProgressBarCoverTooltip(cover, tooltip){
    if(0 === cover) return;

    cover.text = tooltip;
}

//设置进度条遮罩进度
function setProgressBarCoverProgress(cover, progress){
    if(0 === cover) return;

    cover.progress = progress;
}
