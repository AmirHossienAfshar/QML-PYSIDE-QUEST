import sys
from PySide6.QtWidgets import QApplication
from PySide6.QtQml import QQmlApplicationEngine
from Bridge import Bridge


#if name == "__main__":
app = QApplication(sys.argv)



engine = QQmlApplicationEngine()
bridge = Bridge()

engine.rootContext().setContextProperty("Bridge", bridge)
engine.load('EdithInfoPage.qml')

if not engine.rootObjects():
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
