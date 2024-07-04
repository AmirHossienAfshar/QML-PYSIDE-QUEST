import QtQuick 2.15
import QtQuick.Controls 2.15

ApplicationWindow {
    visible: true
    width: 600
    height: 400
    title: "Rooms"

    ListView {
        anchors.fill: parent
        model: roomNumbers
        delegate: Item {
            width: parent.width

            Row {
                spacing: 10
                Text {
                    text: modelData  // Display room number
                    font.pixelSize: 16
                }
                Button {
                    text: "Go to this room"
                    onClicked: {
                        // Handle button click, e.g., navigate to the selected room
                        console.log("Navigating to room", modelData)
                        // Add your navigation logic here
                    }
                }
            }
        }
    }
}
