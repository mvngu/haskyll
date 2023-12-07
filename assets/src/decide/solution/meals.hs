import Text.Printf

-- Tabby's meals on Monday and Friday.
main = do
    let today = "Monday"
    let porkDay = "Monday"
    let sardineDay = "Friday"
    let meal =
            if today == porkDay
                then "pork and mixed vegetables"
                else if today == sardineDay
                         then "sardine"
                         else "other scheduled meal"
    printf "Today's meal: %s\n" meal
