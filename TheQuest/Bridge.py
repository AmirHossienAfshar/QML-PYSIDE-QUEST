# This Python file uses the following encoding: utf-8
from PySide6.QtCore import QObject, Slot, Signal
from Patient import Patient
from Anesthesiologist import Anesthesiologist
from Surgeon import Surgeon
from SurgeryTeam import SurgeryTeam
from Time import Time
from SurgeryType import SurgeryType
from Surgery import Surgery
from SurgeryDAO import SurgeryDAO
from DatabaseModels import SurgeryModel
from PySide6.QtSql import QSqlTableModel
#from PySide6.QtQml import QQmlApplicationEngine


class Bridge(QObject):

    timeOverlapError = Signal(str)
    insertionSuccess = Signal()

    modelUpdated = Signal()

    patientDataFetched = Signal(str, str, str, str)
    SurgeryDataFetched = Signal(str, str)
    AnethDataFetched = Signal(str, str)
    SurgeryTypeDataFetched = Signal(str, str)
    SurgeryTypeTeamFetched = Signal(str, str, str, str)
    TimeFetched = Signal (int, int, int, int, int, str, int)

    def __init__(self):
        super().__init__()
        self.patient = None
        self.surgeon = None
        self.anesthesiologist = None
        self.surgeryTeam = None
        self.time = None
        self.surgeryType = None
        self.surgery = None
        self.Dao = SurgeryDAO(self.surgery)

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

    @Slot()
    def compeletedObject(self):
        self.surgery = Surgery(self.patient, self.surgeon, self.anesthesiologist, self.surgeryType, self.surgeryTeam, self.time)
        surgeryDB = SurgeryDAO(self.surgery)
#        surgeryDB.insertAllData()
        if not surgeryDB.insertAllData():
            overlap_details = surgeryDB.getOverlapDetails()
            self.timeOverlapError.emit(overlap_details)
        else:
#            self.surgeryAdded.emit()
            self.insertionSuccess.emit()

    @Slot()
    def newTry(self):
        print("Updating model... this is newTry function calling")
        self.modelUpdated.emit()


    @Slot(int)
    def requestTofillTable(self, surgeryID):
        print("request is sent", surgeryID)


    @Slot(int)
    def requestPatientInfo(self, surgeryID):
        result = self.Dao.getPatientTable(surgeryID)
        print ("this is the bridge", result[0], result[1], result[2], result[3])
        if result is not None:
            # Unpack the tuple and emit the signal with individual arguments
            self.patientDataFetched.emit(result[0], str(result[1]), result[2], str(result[3]))
        else:
            print(f"Failed to fetch patient data for ID {surgeryID}")

    @Slot(int)
    def requestSurgeonInfo(self, surgeryID):
        result = self.Dao.getSergeonTable(surgeryID)
        print ("this is the bridge", result[0], result[1])
        if result is not None:
            self.SurgeryDataFetched.emit(result[0], str(result[1]))
        else:
            print(f"Failed to fetch patient data for ID {surgeryID}")



    @Slot(int)
    def requestAnethInfo(self, surgeryID):
        result = self.Dao.getAnethTable(surgeryID)
        print ("this is the bridge", result[0], result[1])
        if result is not None:
            self.AnethDataFetched.emit(result[0], str(result[1]))
        else:
            print(f"Failed to fetch patient data for ID {surgeryID}")


    @Slot(int)
    def requestSurgeryTypeInfo(self, surgeryID):
        result = self.Dao.getSurgeryTypeTable(surgeryID)
        print ("this is the bridge", result[0], result[1])
        if result is not None:
            self.SurgeryTypeDataFetched.emit(result[0], str(result[1]))
        else:
            print(f"Failed to fetch patient data for ID {surgeryID}")


    @Slot(int)
    def requestSurgeryTeamInfo(self, surgeryID):
        result = self.Dao.getSurgeryTeamTable(surgeryID)

        if result is not None:
            self.SurgeryTypeTeamFetched.emit(result[0], result[1], result[2], result[3])
        else:
            print(f"Failed to fetch patient data for ID {surgeryID}")


    #print(startSurgeryHour, startSurgeryMin, surgeryDurHour, surgeryDurMin, day, month, year)
    @Slot(int)
    def requestTimeInfo(self, surgeryID):
        result = self.Dao.getTimeTable(surgeryID)

        if result is not None:
            self.TimeFetched.emit(result[0], result[1], result[2], result[3], result[4], result[5], result[6])
        else:
            print(f"Failed to fetch patient data for ID {surgeryID}")


    @Slot(int, str, str, str, str)
    def updatePatientInfo(self, id, PatientName, PatientAge, PatientCompanion, PatientPhoneNumber):
        self.Dao.UpdatePatientTable(id, PatientName, PatientAge, PatientCompanion, PatientPhoneNumber)

    @Slot(int, str, str)
    def updateSurgeonInfo(self, id, SurgeonName, SurgeonExperties):
        self.Dao.UpdateSurgeonTable(id, SurgeonName, SurgeonExperties)

    @Slot(int, str, str)
    def updateAnethInfo(self, id, AnethName, AnethExperties):
        self.Dao.UpdateAnethTable(id, AnethName, AnethExperties)

    @Slot(int, str, str)
    def updateSurgeryTypeInfo(self, id, surgeryType, AnethType):
        self.Dao.UpdateSurgeryTypeTable(id, surgeryType, AnethType)

    @Slot(int, str, str, str, str)
    def updateSurgeryTeamInfo(self, id, AssestSurgen, NurseAnes, ScrubNurse, CirculatingNure):
        self.Dao.UpdateSurgeryTeamTable(id, AssestSurgen, NurseAnes, ScrubNurse, CirculatingNure)

    @Slot(int, int, int, int, int, int, str, int)
    def updateTimeInfo(self, id, StartHour, startMin, DurationHour, DurationMin, Day, Month, year):
        self.Dao.UpdateTimeTable(id ,StartHour, startMin, DurationHour, DurationMin, Day, Month, year)


