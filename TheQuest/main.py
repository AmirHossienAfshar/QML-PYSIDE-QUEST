import sys
from PySide6.QtWidgets import QApplication
from PySide6.QtQml import QQmlApplicationEngine
from Bridge import Bridge
from DatabaseModels import SurgeryModel, RoomsModel, SurgeryProxyModel
from SurgeryDAO import SurgeryDAO


#if name == "__main__":
app = QApplication(sys.argv)

con = SurgeryDAO(None)
con.creatConnection()


engine = QQmlApplicationEngine()
bridge = Bridge()
model = SurgeryModel()
model2 = RoomsModel()

proxy_model = SurgeryProxyModel()##
proxy_model.setSourceModel(model)##

engine.rootContext().setContextProperty("RoomsModel", model2)
engine.rootContext().setContextProperty("Bridge", bridge)
engine.rootContext().setContextProperty("surgeryModel", model)

engine.rootContext().setContextProperty("proxyModel", proxy_model)##

#engine.load('EdithInfoPage.qml')
#engine.load('RoomOperations.qml')
engine.load("main.qml")
#engine.load("Rooms.qml")

####### awsome
def update_model():
    #model2 = SurgeryModel()
    model.refresh()
    #print("this is main and this is the model", model)
    engine.rootContext().setContextProperty("surgeryModel", model)

bridge.modelUpdated.connect(update_model)
####### awsome
def update_model_rooms():
    model2.refresh()
    engine.rootContext().setContextProperty("RoomModel", model2)

bridge.modelUpdated_rooms.connect(update_model_rooms)
#######


##///////////////////////////////////
#def set_room_number(room_number):
#    model.setRoomNumber(room_number)
#    model.refresh()
##///////////////////////////////////


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
