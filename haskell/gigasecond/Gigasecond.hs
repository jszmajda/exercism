module Gigasecond (fromDay) where

import Data.Time.Calendar (Day, addDays)

fromDay :: Day -> Day
fromDay = addDays $ round oneGigaday
  where
    oneGigaday = 10 ^ 9 / 86400
