import QtQuick 2.15
import QtQuick.Controls 2.15

ApplicationWindow {
    visible: true
    width: 1000
    height: 600
    minimumWidth: 950
    minimumHeight: 400
    StackView {
        id: stackView
        initialItem: "RoomOperations.qml"
        //initialItem: "EdithInfoPage.qml"
        anchors.fill: parent
        //onStatusChanged: console.log("StackView status changed:", status)
        onCurrentItemChanged: {
            console.log("Current item changed to:", stackView.currentItem);
        }
    }
}
