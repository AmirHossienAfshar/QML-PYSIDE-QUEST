# This Python file uses the following encoding: utf-8
from PySide6.QtCore import QObject, Slot
from Patient import Patient
from Anesthesiologist import Anesthesiologist
from Surgeon import Surgeon
from SurgeryTeam import SurgeryTeam
from Time import Time
from SurgeryType import SurgeryType
from Surgery import Surgery

class Bridge(QObject):
    def __init__(self):
        super().__init__()
        self.patient = None
        self.surgeon = None
        self.anesthesiologist = None
        self.surgeryTeam = None
        self.time = None
        self.surgeryType = None

    @Slot()
    def printPersonName(self):
        self.patient.GetPatientInfo()
        self.surgeryTeam.GetSurgeryTeamInfo()
        self.time.printInfoTime()
        self.anesthesiologist.GetAnesthesiologistInfo()
        self.surgeon.GetSurgeonInfo()
        self.surgeryType.printSurgeryTypeInfo()

    # name, age, companion, phoneNumber: different fields of patient class
    @Slot(str, str, str, str)
    def creatPatientObject(self, PatientName, PatientAge, PatientCompanion, PatientPhoneNumber):
        self.patient = Patient(PatientName, PatientAge, PatientCompanion , PatientPhoneNumber)

    # assestSergeon, nurseAnes, scrubNurse, circulatingNurse: fields of SurgeryTeam class
    @Slot(str, str, str, str)
    def creatSurgeryTeamObject(self, assestSergeon, nurseAnes, scrubNurse, circulatingNurse):
        self.surgeryTeam = SurgeryTeam(assestSergeon, nurseAnes, scrubNurse, circulatingNurse)

    #(self, startHour, startMin, DurationHour, DurationMin, Day, Month, year)
    @Slot(str, str, str, str, str, str, str)
    def creatDateNTimeObject(self, StartHour, startMin, DurationHour, DurationMin, Day, Month, year):
        self.time = Time(StartHour, startMin, DurationHour, DurationMin, Day, Month, year)

    @Slot(str, str)
    def creatSurgeonObject(self, surgeonName, surgeonExperties):
        self.surgeon = Surgeon(surgeonName, surgeonExperties)

    @Slot(str, str)
    def creatAnesthesiologistObject(self, anesthesiologist, anesthesiologistExperties):
        self.anesthesiologist = Anesthesiologist(anesthesiologist, anesthesiologistExperties)

    @Slot(str, str)
    def creatSurgeryTypeObject(self, surgeryType, anesthesiaType):
        self.surgeryType = SurgeryType(surgeryType, anesthesiaType)

    def compeletedObject(slef):
        self.surgry = Surgery(self.patient, self.surgeon, self.anesthesiologist, self.surgeryType, self.surgeryTeam, self.time)

