import           Text.Printf

main = do
    let likeCat = True
    let likeDog = True
    let likeTiger = True
    let likeWolf = False
    printf "Sam likes cats and dogs? %s\n" $ show $ likeCat && likeDog
    printf "Sam likes tiger or wolf? %s\n" $ show $ likeTiger || likeWolf
    printf "Sam likes cat or tiger? %s\n" $ show $ likeCat || likeTiger
    printf "Sam likes cat and tiger? %s\n" $ show $ likeCat && likeTiger
