import QtQuick 2.0

PLButtonBase{
    id: root_item

    property bool isChecked: false
    property bool canUncheckByManual: true //是否可以手动uncheck


    color: !enabled ? disabledColor :
                      (isChecked ? pressedColor : defaultColor)

    border.color: !enabled ? disabledBorderColor :
                             (isChecked ? pressedBorderColor : defaultBorderColor)



    onClicked:
    {
        if (canUncheckByManual)
        {
            isChecked = !isChecked
            //console.log(isChecked);
        }
        else
        {
            if(!isChecked)
            {
                isChecked = true
            }
        }
    }
}
