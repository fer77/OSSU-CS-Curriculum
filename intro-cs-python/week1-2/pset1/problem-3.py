'''
Assume s is a string of lower case characters.

Write a program that prints the longest substring of s in which the letters occur in alphabetical order. For example, if s = 'azcbobobegghakl', then your program should print

Longest substring in alphabetical order is: beggh
In the case of ties, print the first substring. For example, if s = 'abcbcd', then your program should print

Longest substring in alphabetical order is: abc
'''

longestSubstring = ''
current = s[0]
prev = s[0]

for c in s[1:]:
    if prev <= c:
        current += c
    else:
        if len(current) > len(longestSubstring):
            longestSubstring = current
        current = c
    prev = c

if len(current) > len(longestSubstring):
    longestSubstring = current
print ("Longest substring in alphabetical order is:", longestSubstring)