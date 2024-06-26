from Person import Person

class Patient(Person):                      # Patient inherits from Person
    def __init__(self, name, age, companion=None, phoneNumber= ""):
        super().__init__(name)
        self.age = age
        self.phoneNumber = phoneNumber
        self.companion = companion          # Companion is a Person object
    def getCompanion(self):
        return self.companion
    def setCompanion(self, companion):
        self.companion = companion
    def GetPatientInfo(self):
        print (f"the Patient name is :{self.name}, age is :{self.age},")
        print (f"phone number is: {self.phoneNumber}, compinion name is: {self.companion}")


