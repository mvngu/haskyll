import Text.Printf

-- Sardine day.
main = do
    let today = "Friday"
    let sardineDay = "Friday"
    let meal =
            if today == sardineDay
                then "sardine"
                else "other scheduled meal"
    printf "Today's meal: %s\n" meal
