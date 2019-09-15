import string
from operator import contains

class Phone(object):
    def __init__(self, phone_number):
        self.number = "".join(filter(lambda e: contains(string.digits, e), phone_number))

        if len(self.number) > 10 and (len(self.number) > 11 or self.number[0] != "1"):
            raise ValueError("invalid phone number")
        
        self.number = self.number[-10:]

        if len(self.number) < 10:
            raise ValueError("invalid phone number")

        self.area_code = self.number[0:3]
        self.exchange = self.number[3:6]
        self.local = self.number[-4:]

        if contains("01", self.area_code[0]) or contains("01", self.exchange[0]):
            raise ValueError("invalid phone number")

        pass

    def pretty(self):
        return f"({self.area_code}) {self.exchange}-{self.local}"
