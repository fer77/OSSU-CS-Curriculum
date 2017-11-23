# -*- coding: utf-8 -*-
"""
Created on Wed Jun  8 12:01:04 2016

@author: ericgrimson
"""

import random

low = random.randint(0,101)
high = random.randint(0,101)

print('Please think of a number between 0 and 100!')

while (True):
    guess = (high + low)//2
    print('Is your secret number ' + str(guess) + ' ?')
    userAnswer = input("Enter 'h' to indicate the guess is too high. Enter 'l' to indicate the guess is too low. Enter 'c' to indicate I guessed correctly.")

    if (userAnswer == 'c'):
        print("Game over. Your secret number was: ", int(guess))
        break
    elif (userAnswer == 'h'):
        high = guess
    elif (userAnswer == 'l'):
        low = guess
    else:
        print('Sorry, I did not understand your input.')
        input('Please think of a number between 0 and 100!\n:')