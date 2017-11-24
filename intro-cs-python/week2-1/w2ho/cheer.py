# -*- coding: utf-8 -*-
"""
Created on Wed Jun  8 11:51:57 2016

@author: ericgrimson
"""

word = input("I will cheer for you! Enter a word: ")
times = int(input("Enthusiasm level (1-10): "))
i = 0

while i < len(word):
    char = word[i]
    print("Give me an " + char + "! " + char)
    i += 1
print("What does that spell?")
for i in range(times):
    print(word, "!!!")
