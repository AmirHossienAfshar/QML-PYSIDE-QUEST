import QtQuick
import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts

ApplicationWindow {
    visible: true
    width: 700
    height: 500
    title: "HelloApp"

    Component.onCompleted: {
        width = mainLayout.implicitWidth + 2 * margin
        height = mainLayout.implicitHeight + 2 * margin
    }

    minimumWidth: 200
    minimumHeight: mainLayout.Layout.minimumHeight + 2 * margin

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

                Layout.minimumWidth: 250
                Layout.fillWidth: true
                Layout.fillHeight: true

                font.pixelSize: 15
                font.family: "Calibri"  // Replace with your chosen font



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
                        /*Layout.minimumWidth: 200*/
                        Layout.fillWidth: true
                        /*onTextChanged: {
                            placeholderText: !focused ? "Start typing..." : ""
                        }*/
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



                Layout.minimumWidth: 100
                Layout.fillWidth: true
                Layout.fillHeight: true

                font.pixelSize: 15

                /*background: Rectangle {

                        color:  "gray"
                }*/

                title: "Input2"
                Button {
                    text: qsTr("Button")
                    Layout.fillHeight: true
                }
            }
        }




    }




}

