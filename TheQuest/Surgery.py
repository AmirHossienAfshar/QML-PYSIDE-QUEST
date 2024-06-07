# This Python file uses the following encoding: utf-8
from Patient import patient
from Anesthesiologist import Anesthesiologist
from Surgen import Surgen
from Patient import Patient
from SurgeryTeam import SurgeryTeam

class Surgery:
    def __init__(self, PatientInfo, SurgeonInfo, SurgeryType, SurgeryAnesthesia,
    AnesthesiologistInfo, SurgeryTeamInfo = None):
        self.PatientInfo = PatientInfo                      # object of Patient
        self.SurgeonInfo = SurgeonInfo                      # object of Surgeon
        self.SurgeryType = SurgeryType                      # string from input
        self.SurgeryAnesthesia = SurgeryAnesthesia          # string from input
        self.AnesthesiologistInfo = AnesthesiologistInfo    # object of Anesthesiologist
        self.SurgeryTeamInfo = SurgeryTeamInfo              # object of SurgeryTeam

    def GetSurgeryInfo(self):
        self.PatientInfo.GetPatientInfo()
        self.SurgeonInfo.GetSurgeonInfo()
        self.AnesthesiologistInfo.GetAnesthesiologistInfo()
        self.SurgeryTeamInfo.GetSurgeryTeamInfo()
        print(f"surgery Type is {self.SurgeryType}")
        print(f"SurgeryAnesthesia is {self.SurgeryAnesthesia}")

        #print (f"the Patient name is {self.PatientInfo.name}, age is {self.PatientInfo.age),
