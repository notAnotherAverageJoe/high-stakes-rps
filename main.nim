import random

var gameOptions: seq[string]

gameOptions = @["rock", "paper", "scissors"]

# Function to randomly pick an item from the sequence
proc randomChoice(seq: seq[string]): string =
  let index = rand(0..2)  # range between 0-2
  result = seq[index]       # Return the item at that index

proc bluePick(): string =
    result = randomChoice(gameOptions)

proc redPick(): string =
    result = randomChoice(gameOptions)

var broke = false
var money: int = 100

proc gameTime() =
    echo "Welcome to high stakes rock, paper, scissors"
    while not broke:
        echo "Both Team Red and Team Blue will choose their weapons.\n"
        echo "Place your bets now! or type 'Q' to quit\n"
        echo "Current Cash: ", money,"."
        echo "Pick the team you will bet on winning, 'Red' or 'Blue': "
        var teamBet = readLine(stdin)
        if teamBet notin ["Red", "Blue"]:
            echo "Invalid team choice. Please choose 'Red' or 'Blue'."
            continue
        echo "Acceptable bets: '10', '20', '50' or '100'. Enter now: \n"
        var betPlaced = readLine(stdin)
        var betAmount = 0
        case betPlaced
        of "Q", "q":
            echo "Thanks for stopping by!"
            return
        of "10":
            if money >= 10:
                betAmount = 10
                money -= 10
                echo "$10 bet placed on Team ", teamBet, ". Good luck!\n"
                echo "<->------------------------------------------------------------------------<->"

            else:
                echo "You're broke... Get out."
                broke = true
                return
        of "20":
            if money >= 20:
                betAmount = 20
                money -= 20
                echo "$20 bet placed on Team ", teamBet, ". Good luck!"
                echo "<->------------------------------------------------------------------------<->"


            else:
                echo "Try a lower bet..."
        of "50":
            if money >= 50:
                betAmount = 50
                money -= 50
                echo "$50 bet placed on Team ", teamBet, ". Good luck!"
                echo "<->------------------------------------------------------------------------<->"


            else:
                echo "Try a lower bet..."
                echo "<->------------------------------------------------------------------------<->"


        of "100":
            if money == 100:
                betAmount = 100
                money -= 100
                echo "All in, eh? $100 bet placed on Team ", teamBet, ". Good luck!"
                echo "<->------------------------------------------------------------------------<->"


            else:
                echo "Sorry hotshot, you're low on funds... try a lower bet."
                echo "<->------------------------------------------------------------------------<->"


        else:
            echo "Invalid bet amount."
            echo "<->------------------------------------------------------------------------<->"

            continue

        let redChoice = redPick()
        let blueChoice = bluePick()

        echo "Team Red chooses: ", redChoice
        echo "Team Blue chooses: ", blueChoice

        if redChoice == blueChoice:
            echo "It's a tie! All bets go back."
            money += betAmount
        elif (redChoice == "rock" and blueChoice == "scissors") or
            (redChoice == "scissors" and blueChoice == "paper") or
            (redChoice == "paper" and blueChoice == "rock"):
            echo "Team Red wins!"
            echo "<->------------------------------------------------------------------------<->"

            if teamBet == "Red":
                money += betAmount * 2
                echo "Congratulations! You won $", betAmount * 2, "."
            else:
                echo "Sorry, you lost your bet."
        else:
            echo "Team Blue wins!"
            echo "<->------------------------------------------------------------------------<->"

            if teamBet == "Blue":
                money += betAmount * 2
                echo "Congratulations! You won $", betAmount * 2, "."
                echo "<->------------------------------------------------------------------------<->"

            else:
                echo "Sorry, you lost your bet."
                echo "<->------------------------------------------------------------------------<->"


        if money <= 0:
            echo "You're broke..."
            broke = true
            return

gameTime()
