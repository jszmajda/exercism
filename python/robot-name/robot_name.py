import random
import string
from datetime import datetime

class Robot(object):
    def __init__(self):
        self.name = self.generate_name()
        pass

    def generate_name(self):
        random.seed(datetime.now())
        letters = random.sample(string.ascii_uppercase, 2)
        numbers = random.sample(range(0, 10), 3)
        return "".join(letters + [str(n) for n in numbers])

    def name(self):
        return self.name

    def reset(self):
        self.name = self.generate_name()
        pass


