def slices(series, length):
    entries = len(series) - (length - 1)
    if length < 1 or entries < 1:
        raise ValueError("insufficient source material for length provided") 
    return [ series[offset:(offset + length)] for offset in range(0, entries) ]
