# This Python file uses the following encoding: utf-8


class Time:
    def __init__(self, startHour, startMin, DurationHour, DurationMin, Day, Month, year):
        self.startHour = startHour
        self.startMin = startMin
        self.DurationHour = DurationHour
        self.DurationMin = DurationMin
        self.Day = Day
        self.Month = Month
        self.year = year


    def printStart(self):
        print(f"start operation is on {self.startHour} : {self.startMin} .")

    def printDuration(self):
        print(f"duration of operation is {self.DurationHour} hours and {self.DurationMin} minutes.")

    def printDay(self):
        print(f"the date is {self.Day} // {self.Month} // {self.year} .")

    def printInfoTime(self):
        self.printStart()
        self.printDuration()
        self.printDay()

