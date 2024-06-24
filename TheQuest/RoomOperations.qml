import QtQuick
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import QtQuick.Window 2.2


Page {
    id: newPage
    visible: true
    /*width: 1000
    height: 600*/
    width: parent.width
    height: parent.height
    title: qsTr("Surgery Schedule")

    RowLayout {
        anchors.fill: parent // Fill the entire window

        GroupBox {
            title: "Surgery List"
            Layout.fillHeight: true
            Layout.preferredWidth: 0.7 * parent.width // this is changed instead of using an
                                                     // an static amount of size redused.

            ListView {
                anchors.fill: parent // Fill the GroupBox
                model: surgeryModel

                delegate: Item {
                    width: ListView.view.width
                    height: 100 // Height of each item

                    GroupBox {
                        width: parent.width
                        height: parent.height
                        title: model.surgeonName // Title of GroupBox

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
                                    // Perform your favorite operation here
                                    console.log("Favorite operation clicked for", model.surgeonName);
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
                        //stackView.push(edithPage)
                        stackView.push("EdithInfoPage.qml")
                        console.log("New surgery, stack should append here");
                    }
                    Layout.alignment: Qt.AlignCenter
                    Layout.minimumWidth: 100
                }


                // Add more controls as needed
            }
        }
    }

}



/* // the old method that used to use the column layout.
ApplicationWindow {
    visible: true
    width: 640
    height: 480
    title: qsTr("Surgery Schedule")

    ColumnLayout {

        //title: "the main gropu box is here"
        anchors.fill: parent // Fill the parent, which is the ApplicationWindow

        GroupBox {
            id: mainGroupBox
            //anchors.fill: parent // Fill the parent, which is the ApplicationWindow
            //anchors.bottom: addSurgery.top // Fill the parent, which is the ApplicationWindow
            Layout.fillWidth: true
            Layout.fillHeight: true
            Layout.maximumHeight: parent.height - 100 // Set minimum width for the column

            title: "Main GroupBox"


            ListView {
                anchors.fill: parent // Fill the available space inside the GroupBox
                model: surgeryModel
                clip: false
                interactive: true

                delegate: Item {
                    width: ListView.view.width
                    height: 100 // Height of each GroupBox
                    Layout.minimumHeight: 100 // Set minimum width for the column

                    GroupBox {
                        width: parent.width
                        height: parent.height
                        title: model.surgeonName // Title of GroupBox

                        GridLayout {
                            anchors.fill: parent
                            columns: 3
                            rowSpacing: 10
                            columnSpacing: 0

                            Text {
                                text: "start time: " + model.startTimeHour
                                font.pixelSize: 14
                                Layout.row: 0
                                Layout.column: 0
                                Layout.minimumWidth: 100 // Set minimum width for the column
                                Layout.alignment: Qt.AlignCenter

                            }

                            Text {
                                text: "paitent Name: " + model.patientName
                                font.pixelSize: 14
                                Layout.row: 0
                                Layout.column: 1
                                Layout.minimumWidth: 100 // Set minimum width for the column
                                Layout.alignment: Qt.AlignCenter // Align button to the right

                            }

                            Button {
                                text: "Favorite Operation"
                                onClicked: {
                                    // Perform your favorite operation here
                                    console.log("Favorite operation clicked for", model.surgeonName);
                                }
                                Layout.row: 0
                                Layout.column: 2
                                Layout.minimumWidth: 100 // Set minimum width for the column
                                Layout.alignment: Qt.AlignCenter
                            }
                        }
                    }
                }

            }

        }


        GroupBox {
            id: addSurgery
            title: "add surgery"
            //anchors.top: mainGroupBox.bottom // Fill the parent, which is the ApplicationWindow
            //anchors.fill: parent // Fill the available space inside the GroupBox
            Layout.fillWidth: true

            Layout.minimumHeight: 100 // Set minimum width for the column
            //anchors.bottom:

            Item {
                Layout.fillHeight: true
            }

            Button {
                text: "new surgery"
                onClicked: {
                    console.log("new surgery, stack should append here");
                }
                Layout.minimumWidth: 100 // Set minimum width for the column
                Layout.alignment: Qt.AlignCenter

            }
        }
    }


}*/
