def reverse(text):
    return "".join([ text[(c - 1):c] for c in range(len(text), 0, -1) ])
