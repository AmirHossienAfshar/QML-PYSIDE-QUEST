class SurgeryTeam:
    def __init__(self, AssestSurgen, NurseAnes, ScrubNurse, CirculatingNure): # all types are string
        self.AssestSurgen = AssestSurgen
        self.NurseAnes = NurseAnes
        self.ScrubNurse = ScrubNurse
        self.CirculatingNure = CirculatingNure

    def GetSurgeryTeamInfo(self):
        print(f"AssestSurgen is: {self.AssestSurgen}, NurseAnes is: {self.NurseAnes}")
        print(f"ScrubNurse is: {self.ScrubNurse}, CirculatingNure is {self.CirculatingNure}")
