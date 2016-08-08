"""Allow the user to enter their question
Display an in progress message( i.e. "thinking")
Create 20 responses, and show a random response
Allow the user to ask another question or quit"""

import time
from random import randint

responses = [
    "It is certain",
    "It is decidedly so",
    "Without a doubt",
    "Yes, definitely",
    "You may rely on it",
    "As I see it, yes",
    "Most likely",
    "Outlook good",
    "Yes",
    "Signs point to yes",
    "Reply hazy, try again",
    "Ask again later",
    "Better not tell you now",
    "Cannot predict now",
    "Concentrate and ask again",
    "Don't count on it",
    "My reply is no",
    "My sources say no",
    "Outlook not so good",
    "Very doubtful"
]

while True:
    input("What is your question?: ")
    print("Thinking...")
    time.sleep(3)
    print(responses[randint(0, len(responses)-1)])
    response = input("Go again?: (y/n)")
    if response == "y":
        continue
    else:
        break
