import QtQuick
import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts
import QtQuick.Dialogs


Page {
    id: edithPage
    visible: true
    property int rowNumber: -1  // Assuming this property is set by the parent
    title: "Edith Info Page"

    function showErrorMessage(details) {
        messageDialog.text = "Time overlap, surgery can't be done\n" + details
        messageDialog.visible = true
    }

    function navigateToNextPage() {
        stackView.pop()
        Bridge.newSurgeryAddedSignal()
    }

    MessageDialog {
        id: messageDialog
        title: "Error"
        text: ""
        visible: false
    }

    Component.onCompleted: {
        Bridge.timeOverlapError.connect(showErrorMessage)
        Bridge.insertionSuccess.connect(navigateToNextPage)
        console.log("Navigated to EdithInfoPage with row number:", rowNumber);

        Bridge.patientDataFetched.connect(onPatientDataFetched);
        Bridge.SurgeryDataFetched.connect(onSurgeonDataFetched);
        Bridge.AnethDataFetched.connect(onAnethDataFetched);
        Bridge.SurgeryTypeDataFetched.connect(onSurgeryTypeFetched);
        Bridge.SurgeryTypeTeamFetched.connect(onSurgeryTeamFetched);
        Bridge.TimeFetched.connect(onTimeFetched);


        if (rowNumber !== -1) {
            Bridge.requestPatientInfo(rowNumber+1);
            Bridge.requestSurgeonInfo(rowNumber+1);
            Bridge.requestAnethInfo(rowNumber+1);
            Bridge.requestSurgeryTypeInfo(rowNumber+1);
            Bridge.requestSurgeryTeamInfo(rowNumber+1);
            Bridge.requestTimeInfo(rowNumber+1);

            creatSurgery.visible = false
            creatSurgery.enabled = false
        }
        else
        {
            upadteSurgry.visible = false
            upadteSurgry.enabled = false
        }

    }

    function onPatientDataFetched(name, PatientAge, companionName, patientPhoneNumber) {
        console.log("Received patient data: this is consul", name, PatientAge, companionName, patientPhoneNumber);
        patientName.text = name;
        age.text = PatientAge;
        companion.text = companionName;
        phoneNumber.text = patientPhoneNumber;
    }

    function onSurgeonDataFetched(surgeonName, SurgeonExperties) {
        console.log("Received patient data: this is consul", surgeonName, SurgeonExperties);
        surgeon.text = surgeonName
        surgeonExperties.text = SurgeonExperties
    }

    function onAnethDataFetched(anethName, anethExperties) {
        console.log("Received patient data: this is consul", anethName, anethExperties);
        anesthesiologist.text = anethName
        anesthesiologistExperties.text = anethExperties
    }

    function onSurgeryTypeFetched(SurgeryType, AnethType) {
        console.log("Received patient data: this is consul", SurgeryType, AnethType);
        surgery.text = SurgeryType
        anesthesia.text = AnethType
    }

    function onSurgeryTeamFetched(AssestSurgen, NurseAnes, ScrubNurse, CirculatingNure) {
        console.log("Received patient data: this is consul", AssestSurgen, NurseAnes, ScrubNurse, CirculatingNure);
        assestSergeon.text = AssestSurgen;
        nurseAnes.text = NurseAnes;
        scrubNurse.text = ScrubNurse;
        circulatingNurse.text = CirculatingNure;
    }

    function onTimeFetched(startSurgeryHour, startSurgeryMin, surgeryDurHour, surgeryDurMin, day, month, year) {

        hoursSliderDuration.value = surgeryDurHour
        minutesSliderDuration.value = surgeryDurMin
        hoursSliderStart.value = startSurgeryHour
        minutesSliderStart.value = startSurgeryMin
        dayComboBox.currentIndex = day -1
        //monthComboBox.currentIndex = month //////////////////////////////////////////

        var monthNames = monthComboBox.model;
        var monthIndex = monthNames.indexOf(month.toString());
        monthComboBox.currentIndex = monthIndex;

        var YearNames = yearComboBox.model;
        var YearIndex = YearNames.indexOf(year.toString());
        yearComboBox.currentIndex = YearIndex;

    }

    /*Connections {
        target: Bridge
        onSurgeryAdded: stackView.pop() // Navigate back when surgery is added
        onTimeOverlapError: errorDialog.showErrorMessage(details)
    }*/

    ColumnLayout{
        id: mainLayout
        anchors.fill: parent
        Layout.fillHeight:  true


        RowLayout {
            id: firstRowLayout
            Layout.fillHeight:  true

            anchors.fill: parent
            //anchors.margins: appWindow.margin


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

                    /*Label {
                        text: "this is the ID" + rowNumber
                    }*/

                    TextField {
                        id: patientName
                        Layout.fillWidth: true
                        color: "black"
                        placeholderText: "Start typing..." + rowNumber
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
                                    /*model: ListModel
                                    {
                                        Component.onCompleted:
                                        {
                                            for (var i = 1; i <= 31; i++) {
                                                append({"text": i.toString()})
                                            }
                                        }
                                    }*/
                                    model: ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30"]
                                    //currentIndex : 0
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
                                    /*model: ListModel {
                                        Component.onCompleted: {
                                            for (var i = 2024; i <= 2024; i++) {
                                                append({"text": i.toString()})
                                            }
                                        }
                                    }*/
                                    model: ["2024", "2025", "2026"]  // Replace with your range of years
                                    //currentIndex : 0
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
                        id: creatSurgery
                        text: "Create Surgery"
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
                        id: backToRoom
                        text: "back to surgeries"
                        onClicked: {
                            stackView.pop()
                        }
                    }
                    Button {
                        id: upadteSurgry
                        text: "update the surgery"
                        onClicked: {

                            var monthNames = monthComboBox.model;
                            var MonthComponent = monthNames.indexOf(monthComboBox.currentIndex);
                            //monthComboBox.currentIndex = monthIndex;
                            //monthComboBox.currentText

                            Bridge.updatePatientInfo(rowNumber+1, patientName.text, age.text, companion.text, phoneNumber.text);
                            Bridge.updateSurgeonInfo(rowNumber+1, surgeon.text, surgeonExperties.text)
                            Bridge.updateAnethInfo(rowNumber+1, anesthesiologist.text, anesthesiologistExperties.text)
                            Bridge.updateSurgeryTypeInfo(rowNumber+1, surgery.text, anesthesia.text)
                            Bridge.updateSurgeryTeamInfo(rowNumber+1, assestSergeon.text, nurseAnes.text, scrubNurse.text, circulatingNurse.text)
                            Bridge.updateTimeInfo(rowNumber+1, hoursSliderStart.value, minutesSliderStart.value
                                                  , hoursSliderDuration.value, minutesSliderDuration.value
                                                  , dayComboBox.currentIndex + 1, monthComboBox.currentIndex,
                                                  yearComboBox.currentIndex)
                            stackView.pop()
                        }
                    }
                }
            }
        }
    }
}
