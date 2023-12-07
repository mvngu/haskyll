import Data.Time
import Text.Printf

-- Is it noon yet?
main = do
    dateTime <- getCurrentTime
    timeZone <- getCurrentTimeZone
    let localDateTime = utcToLocalTime timeZone dateTime
    let (TimeOfDay hour _ _) = localTimeOfDay localDateTime
    let h = toInteger hour
    let time =
            if h == 12
                then "It's high noon"
                else "Not yet high noon"
    putStrLn time
