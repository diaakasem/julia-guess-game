const WAIT = 1
const LIMIT = 100
const TRIALS = 5

function intro()
    message("WELCOME TO GUESSES GAME")
end

function welcome(name)
    message("WELCOME $name , LETS START PLAYING")
end

function message(msg)
    clear()
    printable = uppercase(msg)
    println("++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++")
    println("+                                                                               ")
    println("+                      $printable")
    println("+                                                                               ")
    println("++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++")
    run(`say $msg`)
    sleep(WAIT)
    clear()
end


function getUserName()
    println("++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++")
    println("+                                                                               ")
    println("+                            WHAT IS YOUR NAME ?                                ")
    println("+          ( 1- Mariam ) ( 2- Malak ) ( 3- Menna ) ( 4- Diaa )                  ")
    println("++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++")
    run(`say What is your name?`)
    name = readline()
    if name == "1" || lowercase(name) == "mariam"
        return "mariam"
    elseif name == "2" || lowercase(name) == "malak"
        return "malak"
    elseif name == "3" || lowercase(name) == "menna"
        return "mariam"
    elseif name == "4" || lowercase(name) == "diaa"
        return "diaa"
    else
        return getUserName()
    end
end

function clear()
    Base.run(`clear`)
    for var in names(Main)
        try
            eval(parse("$var=0"))
        catch e
        end
    end
end

intro()
name = getUserName()
welcome(name)
message("ok, i will think of a number and you guess it.")
guessedNumber = rand(1:LIMIT)
message("ok, i have a number in my mind")
message("what do you think the number is ?")
function main(trials)
    if trials <= 0
        message("Ouch! You lose $name ! Sorry. ( The Number Was $guessedNumber )")
        return
    end
    num = parse(Int32, readline())
    function timesToGo(trials)
        if trials-1 > 0
            return "[ $(trials-1) more times to go. ]"
        else
            return "[ GAME OVER ]"
        end
    end
    if num > guessedNumber
        message("No, the number in my mind is smaller than $(num). $(timesToGo(trials))")
        main(trials - 1)
    elseif num < guessedNumber
        message("No, the number in my mind is bigger than $(num). $(timesToGo(trials))")
        main(trials - 1)
    else
        message("Excellent! you win $name . woo hoo !!")
        return
    end
end
main(TRIALS)
