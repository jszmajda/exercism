class Acronym {
  companion object {
    // take each word, upcase the first letter
    fun generate(phrase: String) : String {
      var result = ""
      val wordRegex = Regex("\\w+")
      for(match : MatchResult in wordRegex.findAll(phrase))
        result += match.value.get(0).toUpperCase()

      return result
    }
  }
}