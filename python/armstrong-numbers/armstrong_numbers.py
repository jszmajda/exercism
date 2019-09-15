from functools import reduce
from operator import add

def is_armstrong_number(number):
    string = str(number)
    power = len(string)
    result = reduce(add, [ int(digit) ** power for digit in string ], 0)
    return result == number
