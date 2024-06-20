import QtQuick
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import QtQuick.Window 2.2

ApplicationWindow {
    visible: true
    width: 640
    height: 480
    title: qsTr("Surgery Schedule")

    /*ListView {
        anchors.fill: parent
        model: surgeryModel

        delegate: Item {
            width: ListView.view.width
            height: 50

            Rectangle {
                width: parent.width
                height: parent.height
                color: ListView.isCurrentItem ? "#e0e0e0" : "transparent"

                Row {
                    anchors.centerIn: parent

                    Text {
                        text: model.startTimeHour
                        font.pixelSize: 14
                    }

                    Text {
                        text: " Patient: " + model.patientName
                        font.pixelSize: 14
                    }

                    Text {
                        text: " Surgeon: " + model.surgeonName
                        font.pixelSize: 14
                    }
                }
            }
        }
    }*/


    GroupBox {
        id: mainGroupBox
        anchors.fill: parent // Fill the parent, which is the ApplicationWindow
        title: "Main GroupBox"

        ListView {
            anchors.fill: parent // Fill the available space inside the GroupBox
            model: surgeryModel
            clip: false
            interactive: true

            delegate: Item {
                width: ListView.view.width
                height: 100 // Height of each GroupBox

                GroupBox {
                    width: parent.width
                    height: parent.height
                    title: model.patientName + " " + model.surgeonName // Title of GroupBox

                    GridLayout {
                        anchors.fill: parent // Fill the available space inside the GroupBox
                        columns: 3 // Adjust columns count if adding separators
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
}
