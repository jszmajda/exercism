fun transcribeToRna(dna: String): String {
  return dna.map {
    when (it) {
      'C' -> 'G'
      'G' -> 'C'
      'T' -> 'A'
      'A' -> 'U'
      else -> it
    }
  }.joinToString("")
}
