# This Python file uses the following encoding: utf-8
from PySide6.QtSql import QSqlQuery, QSqlTableModel
from PySide6.QtCore import Qt, QByteArray, QModelIndex
from SurgeryDAO import SurgeryDAO
from Surgery import Surgery

#class SurgeryModel(QSqlTableModel):
#    def __init__(self, parent=None):
#        super().__init__(parent)
#        self.data_list = []
#        self.setTable("Surgery")
#        self.select()
#        self.fetch_data()

#    def fetch_data(self):
#        self.data_list.clear()  # Clear previous data
#        query_str = """
#            SELECT Time.startSurgeryHour, Patient.name AS patientName, Surgeon.name AS surgeonName, Surgery.status
#            FROM Surgery
#            JOIN Time ON Surgery.time_id = Time.time_ID
#            JOIN Patient ON Surgery.patient_id = Patient.patient_ID
#            JOIN Surgeon ON Surgery.surgeon_id = Surgeon.sergeon_ID
#            WHERE Surgery.roomNumber = 22;
#        """

#        query = QSqlQuery()
#        if query.exec(query_str):
#            while query.next():
#                startTimeHour = query.value(0)
#                patientName = query.value(1)
#                surgeonName = query.value(2)
#                status = query.value(3)
#                self.data_list.append({
#                    'startTimeHour': startTimeHour,
#                    'patientName': patientName,
#                    'surgeonName': surgeonName,
#                    'status': status
#                })
#                #print(f"startTimeHour: {startTimeHour}, patientName: {patientName}, surgeonName: {surgeonName}, status: {status}")
#        else:
#            print("Query execution failed:", query.lastError().text())

#    def rowCount(self, parent=QModelIndex()):
#        return len(self.data_list)

#    def data(self, index, role=Qt.DisplayRole):
#        if not index.isValid() or index.row() >= len(self.data_list):
#            return None

#        item = self.data_list[index.row()]

#        if role == Qt.DisplayRole:
#            # Provide display role data
#            return f"{item['startTimeHour']} - {item['patientName']} - {item['surgeonName']} - {item['status']}"
#        elif role == Qt.UserRole + 1:
#            return item['startTimeHour']
#        elif role == Qt.UserRole + 2:
#            return item['patientName']
#        elif role == Qt.UserRole + 3:
#            return item['surgeonName']
#        elif role == Qt.UserRole + 4:
#            return item['status']

#        return None

#    def roleNames(self):
#        roles = {
#            Qt.UserRole + 1: QByteArray(b"startTimeHour"),
#            Qt.UserRole + 2: QByteArray(b"patientName"),
#            Qt.UserRole + 3: QByteArray(b"surgeonName"),
#            Qt.UserRole + 4: QByteArray(b"status")
#        }
#        return roles

#    def refresh(self):
#        self.beginResetModel()  # Notify the view that the model is about to change
#        self.fetch_data()
#        self.endResetModel()  # Notify the view that the model has been reset

class RoomsModel(QSqlTableModel):
    def __init__(self, parent=None):
        super().__init__(parent)
        self.data_list = []
        self.setTable("Rooms")
        self.select()
        self.fetch_data()

    def fetch_data(self):
        self.data_list.clear()  # Clear previous data
        query_str = """
            SELECT room_numbers
            FROM Rooms;
        """

        query = QSqlQuery()
        if query.exec(query_str):
            while query.next():
                room_numbers = query.value(0)
                self.data_list.append({
                    'room_numbers': room_numbers
                })
        else:
            print("Query execution failed:", query.lastError().text())

    def rowCount(self, parent=QModelIndex()):
        return len(self.data_list)

    def data(self, index, role=Qt.DisplayRole):
        if not index.isValid() or index.row() >= len(self.data_list):
            return None

        item = self.data_list[index.row()]

        if role == Qt.DisplayRole:
            return str(item['room_numbers'])
        elif role == Qt.UserRole + 1:
            return item['room_numbers']

        return None

    def roleNames(self):
        roles = {
            Qt.UserRole + 1: QByteArray(b"room_numbers")
        }
        return roles

    def refresh(self):
        self.beginResetModel()  # Notify the view that the model is about to change
        self.fetch_data()
        self.endResetModel()  # Notify the view that the model has been reset



class SurgeryModel(QSqlTableModel):
    def __init__(self, parent=None):
        super().__init__(parent)
        self.data_list = []
        self.setTable("Surgery")
        self.select()
        self.fetch_data()

    def fetch_data(self):
        self.data_list.clear()  # Clear previous data
        query_str = """
            SELECT Time.startSurgeryHour, Patient.name AS patientName, Surgeon.name AS surgeonName, Surgery.status, Surgery.roomNumber
            FROM Surgery
            JOIN Time ON Surgery.time_id = Time.time_ID
            JOIN Patient ON Surgery.patient_id = Patient.patient_ID
            JOIN Surgeon ON Surgery.surgeon_id = Surgeon.sergeon_ID;
        """
        query = QSqlQuery()
        if query.exec(query_str):
            while query.next():
                startTimeHour = query.value(0)
                patientName = query.value(1)
                surgeonName = query.value(2)
                status = query.value(3)
                roomNumber = query.value(4)
                self.data_list.append({
                    'startTimeHour': startTimeHour,
                    'patientName': patientName,
                    'surgeonName': surgeonName,
                    'status': status,
                    'roomNumber': roomNumber
                })

    def rowCount(self, parent=QModelIndex()):
        return len(self.data_list)

    def data(self, index, role=Qt.DisplayRole):
        if not index.isValid() or index.row() >= len(self.data_list):
            return None
        item = self.data_list[index.row()]
        if role == Qt.DisplayRole:
            return f"{item['startTimeHour']} - {item['patientName']} - {item['surgeonName']} - {item['status']} - {item['roomNumber']}"
        elif role == Qt.UserRole + 1:
            return item['startTimeHour']
        elif role == Qt.UserRole + 2:
            return item['patientName']
        elif role == Qt.UserRole + 3:
            return item['surgeonName']
        elif role == Qt.UserRole + 4:
            return item['status']
        elif role == Qt.UserRole + 5:
            return item['roomNumber']
        return None

    def roleNames(self):
        roles = {
            Qt.UserRole + 1: QByteArray(b"startTimeHour"),
            Qt.UserRole + 2: QByteArray(b"patientName"),
            Qt.UserRole + 3: QByteArray(b"surgeonName"),
            Qt.UserRole + 4: QByteArray(b"status"),
            Qt.UserRole + 5: QByteArray(b"roomNumber")  # Add roomNumber role
        }
        return roles

    def refresh(self):
        self.beginResetModel()
        self.fetch_data()
        self.endResetModel()
