# This Python file uses the following encoding: utf-8
from PySide6 import QtQuick
from Person import Person
from PySide6.QtCore import QObject, Slot


class Bridge(QObject):
    def __init__(self):
        super().__init__()
        self.person = None


    @Slot(str)
    def createPersonObject(self, name):
        #person1 = Person(name)          # an instance is created, if not wnated, use @classmethod instead
        #person1.makeObject()
        self.person = Person(name)  # Creating a Person object with the provided name
        self.person.makeObject()

    @Slot()
    def printPersonName(self):
        if self.person:
            print(f"The current person's name is: {self.person.name}")
        else:
            print("No person has been created yet.")
