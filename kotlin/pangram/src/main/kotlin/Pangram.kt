class Pangram {
  companion object {

    fun isPangram(input: String) : Boolean {
      return ('a'..'z').all {
        System.out.println("found: ${it} at ${input.indexOf(it)}")
        input.indexOf(it) > -1 || input.indexOf(it.toUpperCase()) > -1
      }
    }

  }
}