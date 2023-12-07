import Data.Time
import Text.Printf

-- The current day of the week.
main = do
    time <- getCurrentTime
    let (year, month, day) = toGregorian $ utctDay time
    let today = dayOfWeek $ fromGregorian year month day
    printf "Today is %s\n" $ show today
