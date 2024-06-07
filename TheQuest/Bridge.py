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

        #  1    2    3    4    5    6    7    8
    @Slot(str, str, str, str, str, str, str, str)
    def createPersonObject(self, ParientName, PatientAge, PatientCompanion, PatientPhoneNumber, assestSergeon, scrubNurse, nurseAnes, circulatingNurse):
        #person1 = Person(name)          # an instance is created, if not wnated, use @classmethod instead
        #person1.makeObject()
        #self.person = Person(name)  # Creating a Person object with the provided name
        #self.person.makeObject()
        self.companion = Person(PatientCompanion)
        self.patient = Patient(ParientName, PatientAge, self.companion, PatientPhoneNumber)
        self.surgeryTeam = SurgeryTeam(assestSergeon, scrubNurse, nurseAnes, circulatingNurse)

    @Slot()
    def printPersonName(self):
        '''if self.person:
            print(f"The current person's name is: {self.person.name}")
        else:
            print("No person has been created yet.")'''
        self.patient.GetPatientInfo()
        self.surgeryTeam.GetSurgeryTeamInfo()
