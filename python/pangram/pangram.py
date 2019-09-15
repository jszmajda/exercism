import string

def is_pangram(sentence):
    lower = sentence.lower()
    return all([ c in lower for c in string.ascii_lowercase ])
