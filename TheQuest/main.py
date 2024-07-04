import sys
from PySide6.QtWidgets import QApplication
from PySide6.QtQml import QQmlApplicationEngine
from Bridge import Bridge
from DatabaseModels import SurgeryModel
from SurgeryDAO import SurgeryDAO


#if name == "__main__":
app = QApplication(sys.argv)

con = SurgeryDAO(None)
con.creatConnection()


engine = QQmlApplicationEngine()
bridge = Bridge()
model = SurgeryModel()

#room_model = RoomModel()
room_model = con.getRoomsTable()
engine.rootContext().setContextProperty("roomNumbers", room_model)

engine.rootContext().setContextProperty("Bridge", bridge)
engine.rootContext().setContextProperty("surgeryModel", model)
#engine.load('EdithInfoPage.qml')
#engine.load('RoomOperations.qml')
engine.load("main.qml")
#engine.load("Rooms.qml")

#######
def update_model():
    #model2 = SurgeryModel()
    model.refresh()
    print("this is main and this is the model2", model)
    engine.rootContext().setContextProperty("surgeryModel2", model)

bridge.modelUpdated.connect(update_model)
#######

if not engine.rootObjects():
    print("Error: QML file not loaded.")
    sys.exit(-1)
sys.exit(app.exec())


'''
import sys

from PySide6.QtGui import QGuiApplication
from PySide6.QtQml import QQmlApplicationEngine



app = QGuiApplication(sys.argv)     # sys.argv: Python list containing the command line
                                    # if not nessecery, could be [] instead
                                    # that sys that we imported at the beggining is that.

engine = QQmlApplicationEngine()    # we only need a QQmlApplicationEngine to load the QML file.
engine.quit.connect(app.quit)
engine.load('EdithInfoPage.qml')
# engine.load('better.qml')

#sys.exit(app.exec())


app.exec() # this calls the event loop to start, the old version was app.exec_();

'''
