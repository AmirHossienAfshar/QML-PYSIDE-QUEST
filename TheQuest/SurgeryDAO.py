# This Python file uses the following encoding: utf-8
from Surgery import Surgery
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



    def insertToTimeTable(self):
        print("this fuction is now calld.")
        self.creatConnection()
        query = QSqlQuery()
        query.prepare("INSERT INTO Time (startSurgeryHour, startSurgeryMin, surgeryDurHour, surgeryDurMin, day, month, year, SurgeryID) VALUES (?, ?,? ,?, ?, ?, ?, ?)")
        query.addBindValue(self.Surgery.time.startHour)
        query.addBindValue(self.Surgery.time.startMin)
        query.addBindValue(self.Surgery.time.DurationHour)
        query.addBindValue(self.Surgery.time.DurationMin)
        query.addBindValue(self.Surgery.time.Day)
        query.addBindValue(self.Surgery.time.Month)
        query.addBindValue(self.Surgery.time.year)
        query.addBindValue(5)

        if not query.exec():
            print(f"Insert error: {query.lastError().text()}")


