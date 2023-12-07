import Data.Time
import Text.Printf

-- Current time of the day in 24-hour format.
main = do
    dateTime <- getCurrentTime
    timeZone <- getCurrentTimeZone
    let localDateTime = utcToLocalTime timeZone dateTime
    let (TimeOfDay hour minute second) = localTimeOfDay localDateTime
    let h = toInteger hour
    let m = toInteger minute
    let s = floor second :: Integer
    printf "Current time: %d hours, %d minutes, and %d seconds\n" h m s
