import QtQuick
import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts

ApplicationWindow {
    visible: true
    width: 700
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
                    rows: 6



                    Label {
                        text: "Room number:"
                    }
                    Label {
                        text: "Surgeon:"
                    }
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

                    TextField {
                        id: surgeon
                        Layout.fillWidth: true
                        color: "black"
                        placeholderText: "Start typing..."
                    }
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
                title: "seorgeyInfo"

                Layout.minimumWidth: 250
                Layout.fillWidth: true
                Layout.fillHeight: true
                font.pixelSize: 15


                GridLayout {
                    flow: GridLayout.TopToBottom // The structure of the GridLayout with rows:
                                                 //3 defines three rows,
                                                 //and the labels will be placed sequentially in those
                                                 //rows by default.
                    anchors.fill: parent
                    rows: 3

                    Label {
                        text: "Surgeon:"
                    }
                    Label {
                        text: "patient:"
                    }
                    Label {
                        text: "Age:"
                    }
                    TextField {
                        //height: 50
                        color: "black"
                        placeholderText: "Start typing..."
                        //Layout.minimumWidth: 200
                        Layout.fillWidth: true
                    }

                    TextField {
                        Layout.fillWidth: true
                        color: "black"
                        placeholderText: "Start typing..."

                    }
                    TextField {
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

                Layout.minimumWidth: 200
                Layout.fillWidth: true
                Layout.fillHeight: true
                font.pixelSize: 15


                title: "Input4"

                GridLayout {
                    flow: GridLayout.TopToBottom // The structure of the GridLayout with rows:
                                                 //3 defines three rows,
                                                 //and the labels will be placed sequentially in those
                                                 //rows by default.
                    anchors.fill: parent
                    rows: 3

                    Label {
                        text: "Surgeon:"
                    }
                    Label {
                        text: "patient:"
                    }
                    Label {
                        text: "Age:"
                    }
                    TextField {
                        //height: 50
                        color: "black"
                        placeholderText: "Start typing..."
                        //Layout.minimumWidth: 200
                        Layout.fillWidth: true
                    }

                    TextField {
                        Layout.fillWidth: true
                        color: "black"
                        placeholderText: "Start typing..."

                    }
                    TextField {
                        Layout.fillWidth: true
                        color: "black"
                        placeholderText: "Start typing..."

                    }
                }
            }

            GroupBox{

                title: "save"


                Layout.minimumWidth: 100
                Layout.fillWidth: true
                Layout.fillHeight: true

                font.pixelSize: 15

                /*background: Rectangle {

                        color:  "gray"
                }*/

                Button {
                    text: qsTr("Button")
                    Layout.fillHeight: true
                }

            }

        }


    }




}

