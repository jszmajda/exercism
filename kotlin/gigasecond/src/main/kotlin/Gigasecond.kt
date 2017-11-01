import java.time.Duration
import java.time.LocalDate
import java.time.LocalDateTime

class Gigasecond(val bornAt: LocalDateTime) {
  constructor(bornOn: LocalDate) : this(bornOn.atTime(0,0))

  val date : LocalDateTime
    get() {
      return bornAt.plus(Duration.ofSeconds(1000000000))
    }
}