# This Python file uses the following encoding: utf-8

class SurgeryType:
    def __init__(self, surgeryType, anesthesiaType):
        self.surgeryType = surgeryType
        self.anesthesiaType = anesthesiaType

    def printSurgeryTypeInfo(self):
        print(f"surgery type is {self.surgeryType} and anesthesiaType is {self.anesthesiaType}")

