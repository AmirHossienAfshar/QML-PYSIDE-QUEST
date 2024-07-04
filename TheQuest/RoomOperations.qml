import QtQuick
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import QtQuick.Window 2.2


Page {
    id: newPage
    visible: true
    width: parent.width
    height: parent.height
    title: qsTr("Surgery Schedule")

    /*
    Component.onCompleted: {
        Bridge.updatedModel.connect(refreshSurgeryModel)
    }

    function refreshSurgeryModel(newModel) {
        //Bridge.refreshSurgeryModel()
        surgeryListView.model = null
        surgeryListView.model = newModel
        //surgeryListView.modelUpdated()
        console.log("this here the connection should be updated rrrrrrrrrrrrrr");
        console.log("Model updated with new data:", newModel);  // Debugging statement
    }*/


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
                model: surgeryModel

                delegate: Item {
                    width: ListView.view.width
                    height: 100

                    GroupBox {
                        width: parent.width
                        height: parent.height
                        title: model.surgeonName

                        GridLayout {
                            anchors.fill: parent
                            columns: 3
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

                            Button {
                                text: "Favorite Operation"
                                onClicked: {
                                    console.log("Edit info clicked for row", model.row);
                                    Bridge.requestTofillTable(model.row)
                                    stackView.push("EdithInfoPage.qml", { rowNumber: model.row });
                                }
                                Layout.row: 0
                                Layout.column: 2
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

                Button {
                    text: "Update the surgery list"
                    onClicked: {
                        console.log("current model ", surgeryListView.model)
                        Bridge.newTry()
                        console.log("Updating model", surgeryModel2)
                        //surgeryListView.model = surgeryModel2
                    }
                    Layout.alignment: Qt.AlignCenter
                    Layout.minimumWidth: 100
                }
            }
        }
    }
}
