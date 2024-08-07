import QtQuick 2.15
import QtQuick.Controls 2.15

ApplicationWindow {
    visible: true
    width: 1000
    height: 600
    minimumWidth: 950
    minimumHeight: 400 // the minimum size of the EdithInfoPage.qml
    title: "surgery"

    StackView {
        id: stackView
        //initialItem: "RoomOperations.qml"
        //initialItem: "EdithInfoPage.qml"
        initialItem: "Rooms.qml"
        anchors.fill: parent
        onCurrentItemChanged: {
            //console.log("Current item changed to:", stackView.currentItem);
        }
    }
}
