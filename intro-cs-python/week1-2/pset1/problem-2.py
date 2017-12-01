'''
Assume s is a string of lower case characters.

Write a program that prints the number of times the string 'bob' occurs in s. For example, if s = 'azcbobobegghakl', then your program should print

Number of times bob occurs is: 2
'''

search = 'bob'
count = 0
startCount = 0 

while startCount >= 0:
    pos = s.find(search, startCount)
    if pos < 0:
      break
    count += 1
    startCount = pos + len(search) -1

print('Number of times bob occurs is: ' + str(count))