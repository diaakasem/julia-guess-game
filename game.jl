const WAIT = 1
const LIMIT = 1000
const TRIALS = 10

function intro()
    message("WELCOME TO GUESSES GAME")
end

function welcome(name)
    message("WELCOME $name , LETS START PLAYING")
end

function message(msg)
    clear()
    printable = uppercase(msg)
    println("+" ^ 80)
    println("+")
    println("+   $printable")
    println("+")
    println("+" ^ 80)
    run(`say $msg`)
    sleep(WAIT)
end


function getUserName()
    clear()
    println("+" ^ 80)
    println("+")
    println("+  WHAT IS YOUR NAME ?")
    println("+  ( 1- Mariam ) ( 2- Malak ) ( 3- Menna ) ( 4- Diaa ) ( 5- Nawal ) ")
    println("+" ^ 80)
    run(`say What is your name?`)
    name = readline()
    if name == "1" || lowercase(name) == "mariam"
        return "mariam"
    elseif name == "2" || lowercase(name) == "malak"
        return "malak"
    elseif name == "3" || lowercase(name) == "menna"
        return "menna"
    elseif name == "4" || lowercase(name) == "diaa"
        return "diaa"
    elseif name == "5" || lowercase(name) == "nawal"
        return "nawal"
    else
        return lowercase(name)
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
message("I will think of a number between 1 and $LIMIT and you have $TRIALS trials to guess it.")
guessedNumber = rand(1:LIMIT)
message("ok, i have a number in my mind, what do you think the number is ?")

global answers = []

function main(trials, lastNum)
    if trials <= 0
        message("Ouch! You lose $name ! Sorry. ( The Number Was $guessedNumber )")
        return
    end
    num = parse(Int32, readline())
    if num in answers
        message("you have already said that number before.")
        return main(trials, lastNum)
    end
    if guessedNumber > lastNum && num < lastNum
        message("Whaat! Say a bigger number.")
        return main(trials, lastNum)
    end
    if guessedNumber < lastNum && num > lastNum
        message("Whaat! Say a smaller number.")
        return main(trials, lastNum)
    end
    function timesToGo(trials)
        if trials > 2
            return ""
        end
        if trials-1 > 1
            return "[ $(trials-1) more times to go. ]"
        elseif trials-1 > 0
            return "[ $(trials-1) more time to go. ]"
        else
            return "[ GAME OVER ]"
        end
    end
    push!(answers, num)
    if num > guessedNumber
        message("No, the number in my mind is smaller than $(num). $(timesToGo(trials))")
        main(trials - 1, num)
    elseif num < guessedNumber
        message("No, the number in my mind is bigger than $(num). $(timesToGo(trials))")
        main(trials - 1, num)
    else
        message("Excellent! you win $name in iteration number $(TRIALS - trials) . woo hoo !!")
        return
    end
end
main(TRIALS, -1)
