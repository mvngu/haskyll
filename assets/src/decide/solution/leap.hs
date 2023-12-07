import Data.Time
import Text.Printf

-- Whether the current year is a leap year.
main = do
    time <- getCurrentTime
    let (year, _, _) = toGregorian $ utctDay time
    if (mod year 4) == 0 && (mod year 100) /= 0
        then do
            let half = div year 2
            printf "%d is a leap year\n" year
            printf "Half of %d is %d\n" year half
        else if (mod year 400) == 0
                 then do
                     let half = div year 2
                     printf "%d is a leap year\n" year
                     printf "Half of %d is %d\n" year half
                 else printf "No ribbit for froggy\n"
