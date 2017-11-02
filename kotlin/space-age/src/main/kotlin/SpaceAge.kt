class SpaceAge(val secondsNum: Number) {

  val seconds : Double = secondsNum.toDouble()
  val earthSeconds = 31557600.0

  fun onEarth(): Double = planetAge(1.0)
  fun onMercury(): Double = planetAge(0.2408467)
  fun onVenus(): Double = planetAge(0.61519726)
  fun onMars(): Double = planetAge(1.8808158)
  fun onJupiter(): Double = planetAge(11.862615)
  fun onSaturn(): Double = planetAge(29.447498)
  fun onUranus(): Double = planetAge(84.016846)
  fun onNeptune(): Double = planetAge(164.79132)

  private fun planetAge(planetYearsInEarthYears: Double) =
    round(seconds / (planetYearsInEarthYears * earthSeconds))

  private fun round(amount: Double) : Double =
    Math.round(amount * 100) / 100.0
}