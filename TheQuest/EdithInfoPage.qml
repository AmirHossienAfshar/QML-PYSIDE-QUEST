import QtQuick
import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts
import QtQuick.Dialogs


ApplicationWindow {
    visible: true
    width: 1000
    height: 550
    title: "Edith Info Page"

    minimumWidth: 950
    minimumHeight: 400

    function showErrorMessage(details) {
            messageDialog.text = "Time overlap, surgery can't be done\n" + details
            messageDialog.visible = true
        }

    MessageDialog {
        id: messageDialog
        title: "Error"
        text: ""
        visible: false
        //standardButtons: StandardButton.Ok
    }

    Component.onCompleted: {
        Bridge.timeOverlapError.connect(showErrorMessage)
    }

    ColumnLayout{
        id: mainLayout
        anchors.fill: parent
        Layout.fillHeight:  true


        RowLayout {
            id: firstRowLayout
            Layout.fillHeight:  true

            anchors.fill: parent
            anchors.margins: appWindow.margin


            GroupBox { // patient info

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
                        validator: IntValidator { bottom: 0; top: 9999 }

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

            GroupBox { // surgery info

                id: seorgeyInfo
                title: "surgery Info"

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

            GroupBox { // date and time
                Layout.fillWidth: true
                Layout.fillHeight: true
                font.pixelSize: 15
                title: "Date and Time"

                GridLayout {
                    flow: GridLayout.TopToBottom
                    anchors.fill: parent
                    rows: 3
                    //spacing: 10
                    Layout.fillWidth: true
                    Layout.fillHeight: true

                    GroupBox {
                        id: durationTime
                        title: "Surgery Duration"
                        Layout.fillWidth: true
                        Layout.fillHeight: true

                        ColumnLayout {
                            spacing: 10
                            Layout.fillWidth: true
                            Layout.fillHeight: true

                            RowLayout {
                                spacing: 10
                                Layout.fillWidth: true
                                Label {
                                    Layout.fillWidth: true
                                    text: "Hours:   "
                                }
                                Slider {
                                    id: hoursSliderDuration
                                    Layout.fillWidth: true
                                    from: 0
                                    to: 24
                                    stepSize: 1
                                    Layout.preferredWidth: 150
                                    onValueChanged: hoursTextDuration.text = value.toString()
                                }
                                Text {
                                    Layout.fillWidth: true
                                    id: hoursTextDuration
                                    text: hoursSliderDuration.value.toString()
                                    Layout.preferredWidth: 50
                                    horizontalAlignment: Text.AlignHCenter
                                }
                            }

                            RowLayout {
                                Layout.fillWidth: true
                                spacing: 10
                                Label {
                                    text: "Minutes:"
                                }
                                Slider {
                                    id: minutesSliderDuration
                                    from: 0
                                    to: 59
                                    stepSize: 1
                                    Layout.preferredWidth: 150
                                    onValueChanged: minutesTextDuration.text = value.toString()
                                }
                                Text {
                                    id: minutesTextDuration
                                    text: minutesSliderDuration.value.toString()
                                    Layout.preferredWidth: 50
                                    horizontalAlignment: Text.AlignHCenter
                                }
                            }
                        }
                    }

                    GroupBox {
                        id: startTime
                        title: "Surgery Start time"
                        Layout.fillWidth: true
                        Layout.fillHeight: true

                        ColumnLayout {
                            spacing: 10
                            Layout.fillWidth: true
                            Layout.fillHeight: true

                            RowLayout {
                                spacing: 10
                                Label {
                                    text: "Hours:   "
                                }
                                Slider {
                                    id: hoursSliderStart
                                    from: 0
                                    to: 24
                                    stepSize: 1
                                    Layout.preferredWidth: 150
                                    onValueChanged: hoursTextStart.text = value.toString()
                                }
                                Text {
                                    id: hoursTextStart
                                    text: hoursSliderStart.value.toString()
                                    Layout.preferredWidth: 50
                                    horizontalAlignment: Text.AlignHCenter
                                }
                            }

                            RowLayout {
                                spacing: 10
                                Label {
                                    text: "Minutes:"
                                }
                                Slider {
                                    id: minutesSliderStart
                                    from: 0
                                    to: 59
                                    stepSize: 1
                                    Layout.preferredWidth: 150
                                    onValueChanged: minutesTextStart.text = value.toString()
                                }
                                Text {
                                    id: minutesTextStart
                                    text: minutesSliderStart.value.toString()
                                    Layout.preferredWidth: 50
                                    horizontalAlignment: Text.AlignHCenter
                                }
                            }
                        }
                    }

                    GroupBox {
                        id: datePiker
                        title: "Select Date"
                        Layout.fillWidth: true
                        Layout.fillHeight: true

                        GridLayout {
                            //spacing: 10
                            Layout.fillWidth: true
                            Layout.fillHeight: true
                            rows : 3
                            RowLayout {
                                spacing: 10
                                Label {
                                    text: "Day:"
                                }
                                ComboBox {
                                    id: dayComboBox
                                    Layout.preferredWidth: 40
                                    Layout.fillWidth: true
                                    model: ListModel
                                    {
                                        Component.onCompleted:
                                        {
                                            for (var i = 1; i <= 31; i++) {
                                                append({"text": i.toString()})
                                            }
                                        }
                                    }
                                    currentIndex : 0
                                }
                            }

                            RowLayout {
                                spacing: 10
                                Label {
                                    text: "Month:"
                                }
                                ComboBox {
                                    id: monthComboBox
                                    Layout.preferredWidth: 80
                                    Layout.fillWidth: parent
                                    model: ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]
                                }
                            }

                            RowLayout {
                                spacing: 10
                                Label {
                                    text: "Year:"
                                }
                                ComboBox {
                                    id: yearComboBox
                                    Layout.preferredWidth: 60
                                    Layout.fillWidth: true
                                    model: ListModel {
                                        Component.onCompleted: {
                                            for (var i = 2024; i <= 2024; i++) {
                                                append({"text": i.toString()})
                                            }
                                        }
                                    }
                                    currentIndex : 0
                                }
                            }

                            /*RowLayout {
                                spacing: 10
                                Button {
                                    text: "Submit"
                                    onClicked: {
                                        var selectedDay = dayComboBox.currentText
                                        var selectedMonth = monthComboBox.currentText
                                        var selectedYear = yearComboBox.currentText
                                        console.log("Date Selected: " + selectedDay + " " + selectedMonth + " " + selectedYear)
                                    }
                                }
                            }*/
                        }
                    }
                }

            }

        }

        RowLayout{
            id: socondRowLayout
            GroupBox { // Surgery Team
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

                ColumnLayout{
                    anchors.fill: parent
                    Layout.fillHeight:  true
                    Button {

                        text: "Create Person"
                        onClicked: {
                            Bridge.creatPatientObject(patientName.text,
                                                      age.text,
                                                      companion.text,
                                                      phoneNumber.text)

                            Bridge.creatSurgeryTeamObject(assestSergeon.text,
                                                          nurseAnes.text,
                                                          scrubNurse.text,
                                                          circulatingNurse.text)

                            Bridge.creatDateNTimeObject(
                                                    hoursSliderStart.value.toString(),
                                                    minutesSliderStart.value.toString(),
                                                    hoursSliderDuration.value.toString(),
                                                    minutesSliderDuration.value.toString(),
                                                    dayComboBox.currentText,
                                                    monthComboBox.currentText,
                                                    yearComboBox.currentText
                                                    )

                            Bridge.creatSurgeonObject(surgeon.text, surgeonExperties.text)

                            Bridge.creatAnesthesiologistObject(anesthesiologist.text,
                                                               anesthesiologistExperties.text)

                            Bridge.creatSurgeryTypeObject(surgery.text, anesthesia.text)
                            Bridge.compeletedObject()

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

