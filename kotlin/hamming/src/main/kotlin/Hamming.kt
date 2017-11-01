class Hamming {
  companion object {
    fun compute(a: String, b: String) : Int {
      if(a.length != b.length){
        throw IllegalArgumentException("left and right strands must be of equal length.")
      }

      return a.zip(b).fold(0) { sum: Int, pair: Pair<Char, Char> ->
        sum + if(pair.first != pair.second) 1 else 0
      }
    }
  }
}