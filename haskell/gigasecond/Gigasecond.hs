module Gigasecond (fromDay) where
import Data.Time.Calendar (Day, addDays)

fromDay :: Day -> Day
fromDay = addDays $ round gigadays
  where
    gigadays    = gigahours / 24
    gigahours   = gigaminutes / 60
    gigaminutes = gs / 60
    gs          = 10 ^ 9
