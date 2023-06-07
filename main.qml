import QtQuick 2.9
import QtQuick.Window 2.2
import QtQuick.Controls
import QtQuick.Layouts

Window {
    id: mainWindow
    visible: true
    width: 480
    height: 640
    title: qsTr("Address Book")
    color: "darkgrey"
    
    ColumnLayout {
        id: mainWindowLayout
        anchors.left: parent.left; anchors.right: parent.right
        spacing: 0
        
        Button {
            id: addButton
            anchors.left: parent.left
            anchors.right: parent.right
            text: "Add..."
            font.pointSize: 24
            onClicked: newAddressPopup.open()
        }
        
        Repeater {
            id: addressListViewer
            model: addressList
            anchors.left: parent.left
            anchors.right: parent.right

            AddressBookItem{
                id: addressBookItem
                onRemoved: addressList.remove(index)
            }
        }
    }
    
    ListModel {
        id: addressList
    }
    
    NewAddressPopup {
        id: newAddressPopup
        onAddressAdded: addressList.append({name: newName, addr: newAddr})
        signal addressAdded(string newName, string newAddr)
    }
}