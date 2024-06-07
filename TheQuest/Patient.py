from Person import Person

class Patient(Person):                      # Patient inherits from Person
    def __init__(self, name, age, phoneNumber, patientId, companion=None):
        super().__init__(name)
        self.age = age
        self.phoneNumber = phoneNumber
        self.companion = companion          # Companion is a Person object
        self.patientId = patientId
    def getCompanion(self):
        return self.companion
    def setCompanion(self, companion):
        self.companion = companion

