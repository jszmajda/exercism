from datetime import timedelta
one_gigasecond = 10**9

def add(moment):
    delta = timedelta(seconds=one_gigasecond)
    return moment + delta
