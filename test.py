import random

print("-----------------")
print("Welcome to the guessing game")
print("-----------------")
p = random.randint(1,10)


while True:
    q = input("Enter your guess number:")
    if q.isdigit():
        q = int(q)
        if p == q:
            print("You won!")
        else:
            print("You lose!")
            print("My guess was" + p)
    else: 
        print("That's not a number!")
    









