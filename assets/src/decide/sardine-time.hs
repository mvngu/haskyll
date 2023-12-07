import Text.Printf

-- The day and time for sardine.
main = do
    let today = "Friday"
    let sardineDay = "Friday"
    let time = 1300 -- 1:00 pm in 24-hour time
    let sardineTime = 1300
    let meal =
            if (today == sardineDay) && (time == sardineTime)
                then "sardine"
                else "other scheduled meal"
    printf "Today's meal: %s\n" meal
