import Data.Time
import Text.Printf

-- Tabby's meal for today.
main = do
    time <- getCurrentTime
    let (year, month, day) = toGregorian $ utctDay time
    let today = show $ dayOfWeek $ fromGregorian year month day
    let porkDay = "Monday"
    let sardineDay = "Friday"
    let meal =
            if today == porkDay
                then "pork and mixed vegetables"
                else if today == sardineDay
                         then "sardine"
                         else "other scheduled meal"
    printf "Today's meal: %s\n" meal
