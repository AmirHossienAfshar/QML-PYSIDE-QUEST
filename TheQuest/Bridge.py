# This Python file uses the following encoding: utf-8
from PySide6 import QtQuick
from Person import Person
from PySide6.QtCore import QObject, Slot
from Patient import Patient
from Anesthesiologist import Anesthesiologist
from Surgeon import Surgeon
from Patient import Patient
from SurgeryTeam import SurgeryTeam

# Bridge.createPersonObject(patientName.text, age.text, companion.text, phoneNumber.text)
# assestSergeon.text, scrubNurse.text, nurseAnes.text, circulatingNurse.text

class Bridge(QObject):
    def __init__(self):
        super().__init__()
        self.companion = None
        self.patient = None
        self.surgeon = None
        self.anesthesiologist = None
        self.surgeryTeam = None

    '''@Slot(str, str, str, str, str, str, str, str)
    def createPersonObject(self, PatientName, PatientAge, PatientCompanion, PatientPhoneNumber, assestSergeon, scrubNurse, nurseAnes, circulatingNurse):
        '''

    @Slot()
    def printPersonName(self):
        '''if self.person:
            print(f"The current person's name is: {self.person.name}")
        else:
            print("No person has been created yet.")'''
        self.patient.GetPatientInfo()
        self.surgeryTeam.GetSurgeryTeamInfo()


    # name, age, companion, phoneNumber: different fields of patient class
    @Slot(str, str, str, str)
    def creatPatientObject(self, PatientName, PatientAge, PatientCompanion, PatientPhoneNumber):
        self.patient = Patient(PatientName, PatientAge, PatientCompanion , PatientPhoneNumber)

    # assestSergeon, nurseAnes, scrubNurse, circulatingNurse: fields of SurgeryTeam class
    @Slot(str, str, str, str)
    def creatSurgeryTeamObject(self, assestSergeon, nurseAnes, scrubNurse, circulatingNurse):
        self.surgeryTeam = SurgeryTeam(assestSergeon, nurseAnes, scrubNurse, circulatingNurse)












