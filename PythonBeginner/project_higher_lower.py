import random

def chooseNum():
    return random.randint(1, 100)

num = chooseNum()
numGuesses = 0
print(num)

while True:
    guess = int(input("Guess: "))
    numGuesses += 1
    if guess == num:
        playagain = input("You guessed correctly in %s turns! Play again? (y/n) " % numGuesses)
        numGuesses = 0
        if playagain == "y":
            num = chooseNum()
            continue
        else:
            break
    elif guess > num:
        print("Go lower.")
        continue
    else:
        print("Go higher.")
        continue
    
