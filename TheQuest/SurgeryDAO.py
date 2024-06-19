# This Python file uses the following encoding: utf-8
from PySide6.QtSql import QSqlDatabase, QSqlQuery, QSqlTableModel

class SurgeryDAO:
    def __init__(self, surgery):
        self.Surgery = surgery

    def creatConnection(self):
        db = QSqlDatabase.addDatabase("QSQLITE")
        db.setDatabaseName("database.db")

        if not db.open():
            print("Unable to establish a database connection.")
            return False

        print("connection is made now")
        return True


    def insertAllData(self):
        self.insertToTimeTable()
        self.insertToPatientTable()
        self.insertToSurgeonTable()
        self.insertToAnethTable()
        self.insertToSurgeryTypeTable()
        self.insertToSurgeryTeamTable()


    def insertToTimeTable(self):
        print("TimeTable is now calld.")
        self.creatConnection()
        query = QSqlQuery()
        query.prepare("INSERT INTO Time (startSurgeryHour, startSurgeryMin, surgeryDurHour, surgeryDurMin, day, month, year) VALUES (?, ?,? ,?, ?, ?, ?)")
        query.addBindValue(self.Surgery.time.startHour)
        query.addBindValue(self.Surgery.time.startMin)
        query.addBindValue(self.Surgery.time.DurationHour)
        query.addBindValue(self.Surgery.time.DurationMin)
        query.addBindValue(self.Surgery.time.Day)
        query.addBindValue(self.Surgery.time.Month)
        query.addBindValue(self.Surgery.time.year)

        if not query.exec():
            print(f"Insert error TimeTable: {query.lastError().text()}")


    def insertToPatientTable(self):
        print("TimeTable is now calld.")
        self.creatConnection()
        query = QSqlQuery()
        query.prepare("INSERT INTO Patient (name, age, companion, phoneNumber) VALUES (?, ?, ?, ?)")
        query.addBindValue(self.Surgery.PatientInfo.name)
        query.addBindValue(self.Surgery.PatientInfo.age)
        query.addBindValue(self.Surgery.PatientInfo.companion)
        query.addBindValue(self.Surgery.PatientInfo.phoneNumber)

        if not query.exec():
            print(f"Insert error Patient table: {query.lastError().text()}")


    def insertToSurgeonTable(self):
        print("SurgeonTable is now calld.")
        self.creatConnection()
        query = QSqlQuery()
        query.prepare("INSERT INTO Surgeon (name, experties) VALUES (?, ?)")
        query.addBindValue(self.Surgery.SurgeonInfo.name)
        query.addBindValue(self.Surgery.SurgeonInfo.experties)

        if not query.exec():
            print(f"Insert error Surgeon Table: {query.lastError().text()}")


    def insertToAnethTable(self):
        print("AnethTable is now calld.")
        self.creatConnection()
        query = QSqlQuery()
        query.prepare("INSERT INTO Aneth (name, experties) VALUES (?, ?)")
        query.addBindValue(self.Surgery.SurgeryAnesthesiaInfo.name)
        query.addBindValue(self.Surgery.SurgeryAnesthesiaInfo.experties)

        if not query.exec():
            print(f"Insert error Aneth Table: {query.lastError().text()}")


    def insertToSurgeryTypeTable(self):
        print("SurgeryType is now calld.")
        self.creatConnection()
        query = QSqlQuery()
        query.prepare("INSERT INTO SurgeryType (surgeryType, AnethType) VALUES (?, ?)")
        query.addBindValue(self.Surgery.SurgeryType.surgeryType)
        query.addBindValue(self.Surgery.SurgeryType.anesthesiaType)

        if not query.exec():
            print(f"Insert error SurgeryType Table: {query.lastError().text()}")


    def insertToSurgeryTeamTable(self):
        print("SurgeryTeam is now calld.")
        self.creatConnection()
        query = QSqlQuery()
        query.prepare("INSERT INTO SurgeryTeam (AssestSurgen, NurseAnes, ScrubNurse, CirculatingNure) VALUES (?, ?, ?, ?)")
        query.addBindValue(self.Surgery.SurgeryTeamInfo.AssestSurgen)
        query.addBindValue(self.Surgery.SurgeryTeamInfo.NurseAnes)
        query.addBindValue(self.Surgery.SurgeryTeamInfo.ScrubNurse)
        query.addBindValue(self.Surgery.SurgeryTeamInfo.CirculatingNure)

        if not query.exec():
            print(f"Insert error SurgeryTeam Table: {query.lastError().text()}")





