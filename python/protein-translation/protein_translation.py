mappings = {
        'AUG': 'Methionine',
        'UUU': 'Phenylalanine',
        'UUC': 'Phenylalanine',
        'UUA': 'Leucine',
        'UUG': 'Leucine',
        'UCU': 'Serine', 
        'UCC': 'Serine', 
        'UCA': 'Serine', 
        'UCG': 'Serine',
        'UAU': 'Tyrosine',
        'UAC': 'Tyrosine',
        'UGU': 'Cysteine',
        'UGC': 'Cysteine',
        'UGG': 'Tryptophan',
        'UAA': 'STOP',
        'UAG': 'STOP', 
        'UGA': 'STOP'
        }

def map_codon(codon):
    return mappings[codon]

def proteins(strand):
    if len(strand) % 3 != 0:
        raise Exception("strand isn't legal")

    translation = []
    for index in range(0, len(strand), 3):
        codon = map_codon(strand[index:index+3])
        if codon == 'STOP':
            break
        translation.append(codon)
   
    return translation


