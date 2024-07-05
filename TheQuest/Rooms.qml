import QtQuick
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import QtQuick.Window 2.2


Page {
    id: rooomsPage
    visible: true
    width: parent.width
    height: parent.height
    title: qsTr("Rooms")


    property int roomCount: 0

    Component.onCompleted: {
        Bridge.roomCountFetched.connect(updateRoomCount)
    }

    function updateRoomCount(count) {
        roomCount = count
        var newRoomNumber = roomCount + 1
        Bridge.newRoom(newRoomNumber)
        Bridge.newTry_rooms()
    }

    RowLayout {
        anchors.fill: parent

        GroupBox {
            title: "Room List"
            Layout.fillHeight: true
            Layout.preferredWidth: 0.7 * parent.width // this is changed instead of using an
                                                     // an static amount of size redused.

            ListView {
                id: roomListView
                anchors.fill: parent
                model: RoomsModel

                delegate: Item {
                    width: ListView.view.width
                    height: 100

                    GroupBox {
                        width: parent.width
                        height: parent.height
                        title: "room"

                        GridLayout {
                            anchors.fill: parent
                            columns: 2
                            rowSpacing: 10
                            columnSpacing: 10

                            Text {
                                text: "Room number: " + model.room_numbers
                                font.pixelSize: 14
                                Layout.row: 0
                                Layout.column: 0
                                Layout.minimumWidth: 100
                                Layout.alignment: Qt.AlignCenter
                            }


                            Button {
                                text: "go to surgery list"
                                onClicked: {
                                    console.log("got to surgery room number: ", model.row + 1);
                                    //Bridge.requestTofillTable(model.row)
                                    stackView.push("RoomOperations.qml", { surgeryRoomNumber: model.row + 1 });
                                }
                                Layout.row: 0
                                Layout.column: 1
                                Layout.minimumWidth: 100
                                Layout.alignment: Qt.AlignCenter
                            }
                        }
                    }
                }
            }
        }

        // Second GroupBox
        GroupBox {
            title: "Controls"
            Layout.fillHeight: true
            Layout.preferredWidth: 0.3 * parent.width // 30% width for the second GroupBox

            ColumnLayout {
                anchors.fill: parent // Fill the GroupBox

                Button {
                    text: "New Room"
                    onClicked: {
                        //Bridge.newSurgeryAddedModelUpdated()
                        //stackView.push("EdithInfoPage.qml")
                        //Bridge.newRoom(10) ///////////////////////update has problems too////////////this part must be dn
                        //Bridge.newTry_rooms()
                        Bridge.getRoomCount()
                    }
                    Layout.alignment: Qt.AlignCenter
                    Layout.minimumWidth: 100
                }
            }
        }
    }
}
