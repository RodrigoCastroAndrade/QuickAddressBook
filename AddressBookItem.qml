import QtQuick 2.3
import QtQuick.Layouts
import QtQuick.Controls

Rectangle {
    id: addressBookItem
    color: (index % 2) == 0 ? "dimgray" : "lightgray"
    anchors.left: parent.left
    anchors.right: parent.right
    height: itemText.height + 12

    signal removed()

    RowLayout {
        spacing: 12
        anchors.left: parent.left
        anchors.leftMargin: spacing

        RoundButton {
            id: deleteButton
            text: "🗙"
            font.pointSize: 12
            palette.buttonText: "Red"
            onClicked: addressBookItem.removed()
        }

        Text {
            id: itemText
            font.pointSize: 24
            text: "<b>" + name + "</b><br><i>" + addr + "</i>" 
        }
    }
}
