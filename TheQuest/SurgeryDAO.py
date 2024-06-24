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

        #print("connection is made now")
        return True


    def insertAllData(self): # this place has to be checked whether the operation is possible
        if self.IsTimeNotOverLaping():
            time_id = self.insertToTimeTable()
            patient_id = self.insertToPatientTable()
            surgeon_id = self.insertToSurgeonTable()
            anesthetist_id = self.insertToAnethTable()
            surgeryType_id = self.insertToSurgeryTypeTable()
            team_id = self.insertToSurgeryTeamTable()

            if all(id != -1 for id in [time_id, patient_id, surgeon_id, anesthetist_id, surgeryType_id,team_id]):
                self.insertToSurgeryTable(time_id, patient_id, surgeon_id, anesthetist_id, surgeryType_id, team_id)
                return True
        else:
            return False

    def insertToTimeTable(self):
        #print("TimeTable is now calld.")
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
        return query.lastInsertId()


    def insertToPatientTable(self):
        #print("TimeTable is now calld.")
        self.creatConnection()
        query = QSqlQuery()
        query.prepare("INSERT INTO Patient (name, age, companion, phoneNumber) VALUES (?, ?, ?, ?)")
        query.addBindValue(self.Surgery.PatientInfo.name)
        query.addBindValue(self.Surgery.PatientInfo.age)
        query.addBindValue(self.Surgery.PatientInfo.companion)
        query.addBindValue(self.Surgery.PatientInfo.phoneNumber)

        if not query.exec():
            print(f"Insert error Patient table: {query.lastError().text()}")
        return query.lastInsertId()


    def insertToSurgeonTable(self):
        #print("SurgeonTable is now calld.")
        self.creatConnection()
        query = QSqlQuery()
        query.prepare("INSERT INTO Surgeon (name, experties) VALUES (?, ?)")
        query.addBindValue(self.Surgery.SurgeonInfo.name)
        query.addBindValue(self.Surgery.SurgeonInfo.experties)

        if not query.exec():
            print(f"Insert error Surgeon Table: {query.lastError().text()}")
        return query.lastInsertId()


    def insertToAnethTable(self):
        #print("AnethTable is now calld.")
        self.creatConnection()
        query = QSqlQuery()
        query.prepare("INSERT INTO Aneth (name, experties) VALUES (?, ?)")
        query.addBindValue(self.Surgery.SurgeryAnesthesiaInfo.name)
        query.addBindValue(self.Surgery.SurgeryAnesthesiaInfo.experties)

        if not query.exec():
            print(f"Insert error Aneth Table: {query.lastError().text()}")
        return query.lastInsertId()


    def insertToSurgeryTypeTable(self):
        #print("SurgeryType is now calld.")
        self.creatConnection()
        query = QSqlQuery()
        query.prepare("INSERT INTO SurgeryType (surgeryType, AnethType) VALUES (?, ?)")
        query.addBindValue(self.Surgery.SurgeryType.surgeryType)
        query.addBindValue(self.Surgery.SurgeryType.anesthesiaType)

        if not query.exec():
            print(f"Insert error SurgeryType Table: {query.lastError().text()}")
        return query.lastInsertId()


    def insertToSurgeryTeamTable(self):
        #print("SurgeryTeam is now calld.")
        self.creatConnection()
        query = QSqlQuery()
        query.prepare("INSERT INTO SurgeryTeam (AssestSurgen, NurseAnes, ScrubNurse, CirculatingNure) VALUES (?, ?, ?, ?)")
        query.addBindValue(self.Surgery.SurgeryTeamInfo.AssestSurgen)
        query.addBindValue(self.Surgery.SurgeryTeamInfo.NurseAnes)
        query.addBindValue(self.Surgery.SurgeryTeamInfo.ScrubNurse)
        query.addBindValue(self.Surgery.SurgeryTeamInfo.CirculatingNure)

        if not query.exec():
            print(f"Insert error SurgeryTeam Table: {query.lastError().text()}")
        return query.lastInsertId()


    def insertToSurgeryTable(self, time_id, patient_id, surgeon_id, anesthetist_id, surgeryType_id, team_id):
        #print("SurgeryTable is now called.")
        self.creatConnection()
        query = QSqlQuery()
        query.prepare("INSERT INTO Surgery (time_ID, patient_ID, surgeon_ID, aneth_ID, team_ID,surgeryType_ID, roomNumber) VALUES (?, ?, ?, ?, ?, ?, ?)")
        query.addBindValue(time_id)
        query.addBindValue(patient_id)
        query.addBindValue(surgeon_id)
        query.addBindValue(anesthetist_id)
        query.addBindValue(team_id)
        query.addBindValue(surgeryType_id)
        query.addBindValue(22) # this field has to be setted with the need of its own.

        if not query.exec():
           print(f"Insert error Surgery Table: {query.lastError().text()}")

        print("Surgery data inserted successfully.")
        return query.lastInsertId()


    def IsTimeNotOverLaping(self):
        self.creatConnection()

        start_hours = []
        start_mins = []
        duration_hours = []
        duration_mins = []

        query = QSqlQuery()
        query.prepare("""
            SELECT t.startSurgeryHour, t.startSurgeryMin, t.surgeryDurHour, t.surgeryDurMin
            FROM Surgery s
            JOIN Time t ON s.time_id = t.time_id
            WHERE t.day = ? AND t.month = ? AND t.year = ?
        """)
        query.addBindValue(self.Surgery.time.Day)
        query.addBindValue(self.Surgery.time.Month)
        query.addBindValue(self.Surgery.time.year)

        if query.exec():
            while query.next():
                start_hours.append(int(query.value(0)))
                start_mins.append(int(query.value(1)))
                duration_hours.append(int(query.value(2)))
                duration_mins.append(int(query.value(3)))
        else:
            print(f"Query error: {query.lastError().text()}")

        '''
        print("Start Hours:", start_hours)
        print("Start Minutes:", start_mins)
        print("Duration Hours:", duration_hours)
        print("Duration Minutes:", duration_mins)
        '''

        start_database = [0] * len(start_hours)
        finish_database = [0] * len(start_hours)

        if len(start_hours) == 0:
            return True

        for i in (0 , len(start_hours)-1):
            start_database[i] = int(start_hours[i] * 60 + start_mins[i])
            finish_database[i] = int(start_database[i] + (duration_hours[i] * 60 + duration_mins[i]))

        thisStart = int(self.Surgery.time.startHour) * 60 + int(self.Surgery.time.startMin)
        thisFinish = thisStart + (int(self.Surgery.time.DurationHour) * 60 + int(self.Surgery.time.DurationMin))

        for i in (0 , len(start_hours)-1):
            if start_database[i] <= thisStart and thisStart <= finish_database[i]:
                print("time overlap1")
                self.overlapDetail = f"can not add surgery between {start_hours[i]}:{start_mins[i]} unitll {finish_database[i]//60}:{ finish_database[i]%60}"
                return False
            if start_database[i] <= thisFinish and thisFinish <= finish_database[i]:
                print("time overlap2")
                self.overlapDetail = f"can not add surgery between {start_hours[i]}:{start_mins[i]} unitll {finish_database[i]//60}:{ finish_database[i]%60}"
                return False
            if thisStart <= start_database[i] and finish_database[i] <= thisFinish:
                print("time overlap3")
                self.overlapDetail = f"can not add surgery between {start_hours[i]}:{start_mins[i]} unitll {finish_database[i]//60}:{ finish_database[i]%60}"
                return False

        return True


    def getOverlapDetails(self):
        return self.overlapDetail


    def getPatientTable(self, surgeryID):
        self.creatConnection()
        query = QSqlQuery()
        query.prepare("SELECT name, age, companion, phoneNumber FROM Patient WHERE patient_ID = :id")
        query.bindValue(":id", surgeryID)

        if query.exec():
            if query.next():
                name = query.value(0)
                PatientAge = query.value(1)
                companionName = query.value(2)
                phoneNumber = query.value(3)

                # Emit the fetched data through the signal
                # self.patientDataFetched.emit(name, age, companionName, phoneNumber)
                print(name, PatientAge, companionName, phoneNumber)
                return (name, PatientAge, companionName, phoneNumber)
            else:
                print(f"No patient found with ID {surgeryID}")
        else:
            print(f"Query failed: {query.lastError().text()}")


    def getSergeonTable(self, surgeryID):
        self.creatConnection()
        query = QSqlQuery()
        query.prepare("SELECT name, experties FROM Surgeon WHERE sergeon_ID = :id")
        query.bindValue(":id", surgeryID)

        if query.exec():
            if query.next():
                SurgeonName = query.value(0)
                sergeonExperties = query.value(1)

                print(SurgeonName, sergeonExperties)
                return (SurgeonName, sergeonExperties)
            else:
                print(f"No patient found with ID {surgeryID}")
        else:
            print(f"Query failed: {query.lastError().text()}")


    def getAnethTable(self, surgeryID):
        self.creatConnection()
        query = QSqlQuery()
        query.prepare("SELECT name, experties FROM Aneth WHERE aneth_ID = :id")
        query.bindValue(":id", surgeryID)

        if query.exec():
            if query.next():
                AnethName = query.value(0)
                AnethExperties = query.value(1)

                print(AnethName, AnethExperties)
                return (AnethName, AnethExperties)
            else:
                print(f"No patient found with ID {surgeryID}")
        else:
            print(f"Query failed: {query.lastError().text()}")

    def getSurgeryTypeTable(self, surgeryID):
        self.creatConnection()
        query = QSqlQuery()
        query.prepare("SELECT surgeryType, AnethType FROM SurgeryType WHERE surgeryType_ID = :id")
        query.bindValue(":id", surgeryID)

        if query.exec():
            if query.next():
                surgeryType = query.value(0)
                AnethType = query.value(1)

                print(surgeryType, AnethType)
                return (surgeryType, AnethType)
            else:
                print(f"No patient found with ID {surgeryID}")
        else:
            print(f"Query failed: {query.lastError().text()}")



    def getSurgeryTeamTable(self, surgeryID):
        self.creatConnection()
        query = QSqlQuery()
        query.prepare("SELECT AssestSurgen, NurseAnes, ScrubNurse, CirculatingNure FROM SurgeryTeam WHERE surgeryTeam_ID = :id")
        query.bindValue(":id", surgeryID)

        if query.exec():
            if query.next():
                AssestSurgen = query.value(0)
                NurseAnes = query.value(1)
                ScrubNurse = query.value(2)
                CirculatingNure = query.value(3)

                print(AssestSurgen, NurseAnes, ScrubNurse, CirculatingNure)
                return (AssestSurgen, NurseAnes, ScrubNurse, CirculatingNure)
            else:
                print(f"No patient found with ID {surgeryID}")
        else:
            print(f"Query failed: {query.lastError().text()}")


    def getTimeTable(self, surgeryID):
        self.creatConnection()
        query = QSqlQuery()
        query.prepare("SELECT startSurgeryHour, startSurgeryMin, surgeryDurHour, surgeryDurMin, day, month, year FROM Time WHERE time_ID = :id")
        query.bindValue(":id", surgeryID)

        if query.exec():
            if query.next():
                startSurgeryHour = query.value(0)
                startSurgeryMin = query.value(1)
                surgeryDurHour = query.value(2)
                surgeryDurMin = query.value(3)
                day = query.value(4)
                month = query.value(5)
                year = query.value(6)

                print(startSurgeryHour, startSurgeryMin, surgeryDurHour, surgeryDurMin, day, month, year)
                return (startSurgeryHour, startSurgeryMin, surgeryDurHour, surgeryDurMin, day, month, year)
            else:
                print(f"No patient found with ID {surgeryID}")
        else:
            print(f"Query failed: {query.lastError().text()}")
