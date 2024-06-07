import QtQuick
import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts

ApplicationWindow {
    visible: true
    width: 800
    height: 500
    title: "Edith Info Page"

    minimumWidth: 800
    minimumHeight: 400

    ColumnLayout{
        id: mainLayout
        anchors.fill: parent
        Layout.fillHeight:  true


        RowLayout {
            id: firstRowLayout
            Layout.fillHeight:  true

            anchors.fill: parent
            anchors.margins: appWindow.margin


            GroupBox {

                id: patientInfo
                title: "Patient Info"

                Layout.minimumWidth: 300
                Layout.fillWidth: true
                Layout.fillHeight: true

                font.pixelSize: 15

                GridLayout {
                    flow: GridLayout.TopToBottom //The structure of the GridLayout with rows:
                                                 //6 defines 6 rows,
                                                 //and the labels will be placed sequentially in those
                                                 //rows by default.
                    anchors.fill: parent
                    rows: 5



                    Label {
                        text: "Room number:"
                    }
                    /*Label {
                        text: "Surgeon:"
                    }*/
                    Label {
                        text: "patient name:"
                    }
                    Label {
                        text: "Age:"
                    }
                    Label {
                        text: "companion:"
                    }
                    Label {
                        text: "phone number:"
                    }


                    ComboBox {
                        id: roomNumber
                        Layout.fillWidth: true
                        editable: true
                        model: ListModel {
                            id: model
                            ListElement { text: "1" }
                            ListElement { text: "2" }
                            ListElement { text: "3" }
                        }
                        onAccepted: {
                            if (find(editText) === -1)
                                model.append({text: editText})
                        }
                    }

                    /*TextField {
                        id: surgeon
                        Layout.fillWidth: true
                        color: "black"
                        placeholderText: "Start typing..."
                    }*/
                    TextField {
                        id: patientName
                        Layout.fillWidth: true
                        color: "black"
                        placeholderText: "Start typing..."
                    }
                    TextField {
                        id: age
                        Layout.fillWidth: true
                        color: "black"
                        placeholderText: "Start typing..."
                    }
                    TextField {
                        id: companion
                        Layout.fillWidth: true
                        color: "black"
                        placeholderText: "Start typing..."
                    }
                    TextField {
                        id: phoneNumber
                        Layout.fillWidth: true
                        color: "black"
                        placeholderText: "Start typing..."
                    }

                }
            }

            GroupBox {

                id: seorgeyInfo
                title: "seorgey Info"

                Layout.minimumWidth: 300
                Layout.fillWidth: true
                Layout.fillHeight: true
                font.pixelSize: 15


                GridLayout {
                    flow: GridLayout.TopToBottom // The structure of the GridLayout with rows:
                                                 //3 defines three rows,
                                                 //and the labels will be placed sequentially in those
                                                 //rows by default.
                    anchors.fill: parent
                    rows: 6

                    Label {
                        text: "Surgery:"
                    }
                    Label {
                        text: "Anesthesia:"
                    }
                    Label {
                        text: "Surgeon:"
                    }
                    Label {
                        text: "experties:"
                    }
                    Label {
                        text: "Anesthesiologist:"
                    }
                    Label {
                        text: "experties:"
                    }
                    TextField {
                        id: surgery
                        color: "black"
                        placeholderText: "Start typing..."
                        Layout.fillWidth: true
                    }

                    TextField {
                        id: anesthesia
                        Layout.fillWidth: true
                        color: "black"
                        placeholderText: "Start typing..."

                    }
                    TextField {
                        id: surgeon
                        Layout.fillWidth: true
                        color: "black"
                        placeholderText: "Start typing..."
                    }
                    TextField {
                        id: surgeonExperties
                        Layout.fillWidth: true
                        color: "black"
                        placeholderText: "Start typing..."
                    }
                    TextField {
                        id: anesthesiologist
                        Layout.fillWidth: true
                        color: "black"
                        placeholderText: "Start typing..."
                    }
                    TextField {
                        id: anesthesiologistExperties
                        Layout.fillWidth: true
                        color: "black"
                        placeholderText: "Start typing..."
                    }

                }
            }

            GroupBox
            {
                Layout.minimumWidth: 250
                Layout.fillWidth: true
                Layout.fillHeight: true
                font.pixelSize: 15

                title: "Input3"

            }
        }

        RowLayout{
            id: socondRowLayout
            GroupBox {
                id: surgeryTeam
                title: "Surgery Team"

                Layout.minimumWidth: 200
                Layout.fillWidth: true
                Layout.fillHeight: true
                font.pixelSize: 15



                GridLayout {
                    flow: GridLayout.TopToBottom
                    anchors.fill: parent

                    rows: 4

                    Label {
                        text: "Assest sergeon:"
                    }
                    Label {
                        text: "Scrub Nurse:"
                    }
                    Label {
                        text: "Nurse Anes:"
                    }
                    Label {
                        text: "Circulating Nurse:"
                    }
                    TextField {
                        id: assestSergeon
                        Layout.fillWidth: true
                        placeholderText: "Start typing..."
                    }

                    TextField {
                        id: scrubNurse
                        Layout.fillWidth: true
                        placeholderText: "Start typing..."

                    }
                    TextField {
                        id: nurseAnes
                        Layout.fillWidth: true
                        placeholderText: "Start typing..."
                    }
                    TextField
                    {
                        id: circulatingNurse
                        placeholderText: "Start typing..."
                        Layout.fillWidth: true
                    }
                }
            }

            GroupBox{

                title: "save"


                Layout.minimumWidth: 200
                Layout.fillWidth: true
                Layout.fillHeight: true

                font.pixelSize: 15

                /*background: Rectangle {

                        color:  "gray"
                }*/

                ColumnLayout{
                    anchors.fill: parent
                    Layout.fillHeight:  true
                    Button {

                        text: "Create Person"
                        onClicked: {
                            Bridge.createPersonObject(patientName.text, age.text, companion.text, phoneNumber.text,
                                                      assestSergeon.text, scrubNurse.text, nurseAnes.text, circulatingNurse.text )
                        }
                    }

                    Button {

                        text: "Print Person's Name"
                        onClicked: {
                            Bridge.printPersonName()
                        }
                    }
                }
            }

        }


    }

}

