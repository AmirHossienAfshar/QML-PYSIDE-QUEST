from Person import Person

class Anesthesiologist(Person):
    def __init__(self, name= "", experties = ""):   # the default vaiables are setted to none
        Person.__init__(self, name)                 # Call the Person class's __init__ method
        self.experties = experties

    def getExperties(self):                         # cpp like oop class functions
        return self.experties

    def setExperties(self, experties):
        self.experties = experties


