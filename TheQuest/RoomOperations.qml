import QtQuick
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import QtQuick.Window 2.2
import QtQml.Models 2.15 // Import the module for SortFilterProxyModel
Page {
    id: newPage
    visible: true
    width: parent.width
    height: parent.height
    title: qsTr("Surgery Schedule")
    property int surgeryRoomNumber: -1


    //onSurgeryRoomNumberChanged: filterSurgeryList()


    /*
    SortFilterProxyModel {
        id: proxyModel
        sourceModel: surgeryModel // Your original model
        filterRoleName: "roomNumber" // Ensure this role exists in your model
        filterValue: surgeryRoomNumber
    }
*/

    /*ListModel {
        id: filteredSurgeryModel
    }

    function filterSurgeryList() {
        filteredSurgeryModel.clear()
        for (var i = 0; i < surgeryModel.count; ++i) {
            var item = surgeryModel.get(i)
            if (item.roomNumber === surgeryRoomNumber) {
                filteredSurgeryModel.append(item)
            }
        }
        console.log("this is the filterd of rooms", filteredSurgeryModel);

    }

    Component.onCompleted: {
        filterSurgeryList()
    }*/

    Component.onCompleted: {
        proxyModel.setRoomNumber(surgeryRoomNumber)
    }

    RowLayout {

        anchors.fill: parent

        GroupBox {
            title: "Surgery List"
            Layout.fillHeight: true
            Layout.preferredWidth: 0.7 * parent.width // this is changed instead of using an
                                                     // an static amount of size redused.

            ListView {
                id: surgeryListView
                anchors.fill: parent
                //model: surgeryModel
                //model: filteredSurgeryModel
                model : proxyModel
                delegate: Item {
                    width: ListView.view.width
                    height: 100

                    GroupBox {
                        width: parent.width
                        height: parent.height
                        title: model.surgeonName ////

                        GridLayout {
                            anchors.fill: parent
                            columns: 4
                            rowSpacing: 10
                            columnSpacing: 10

                            Text {
                                text: "Start time: " + model.startTimeHour
                                font.pixelSize: 14
                                Layout.row: 0
                                Layout.column: 0
                                Layout.minimumWidth: 100
                                Layout.alignment: Qt.AlignCenter
                            }

                            Text {
                                text: "Patient Name: " + model.patientName
                                font.pixelSize: 14
                                Layout.row: 0
                                Layout.column: 1
                                Layout.minimumWidth: 100
                                Layout.alignment: Qt.AlignCenter
                            }

                            Text {
                                text: "status: " + model.status
                                font.pixelSize: 14
                                Layout.row: 0
                                Layout.column: 2
                                Layout.minimumWidth: 100
                                Layout.alignment: Qt.AlignCenter
                            }

                            Button {
                                text: "Edith this Operation"
                                onClicked: {
                                    console.log("Edit info clicked for row", model.row);
                                    Bridge.requestTofillTable(model.row)
                                    //Bridge.setRoomNumber(model.room_numbers)
                                    stackView.push("EdithInfoPage.qml", { rowNumber: model.row });
                                    console.log("and here is the room number", surgeryRoomNumber);

                                }
                                Layout.row: 0
                                Layout.column: 3
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
                    text: "New Surgery"
                    onClicked: {
                        //Bridge.newSurgeryAddedModelUpdated()
                        stackView.push("EdithInfoPage.qml")
                        //console.log("New surgery, stack should append here");
                    }
                    Layout.alignment: Qt.AlignCenter
                    Layout.minimumWidth: 100
                }
                /* // since the update is automatic, then it wont be neccesury to be here.
                Button {
                    text: "Update the surgery list"
                    onClicked: {
                        //console.log("current model ", surgeryListView.model)
                        Bridge.newTry()
                        //console.log("Updating model", surgeryModel2)
                        //surgeryListView.model = surgeryModel2
                    }
                    Layout.alignment: Qt.AlignCenter
                    Layout.minimumWidth: 100
                }
                */
                Button {
                    text: "Back to rooms page"
                    onClicked: {
                        stackView.pop()
                    }
                    Layout.alignment: Qt.AlignCenter
                    Layout.minimumWidth: 100
                }
            }
        }
    }

    /*SortFilterProxyModel {
        id: proxyModel
        sourceModel: surgeryModel
        filterRoleName: "roomNumber"
        filterValue: surgeryRoomNumber
    }*/

    /*Component.onCompleted: {
        surgeryRoomNumber = 1 // Initial room number or set it dynamically
    }*/
}
