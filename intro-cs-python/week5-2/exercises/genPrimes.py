'''
Exercise: genPrimes

Write a generator, genPrimes, that returns the sequence of prime numbers on successive calls to its next() method: 2, 3, 5, 7, 11, ...

'''
def genPrimes():
    num = [2]
    yield num[0]
    check_if_prime = 3
    while True:
        if all(check_if_prime % n != 0 for n in num):
            num.append(check_if_prime)        
        if check_if_prime == num[-1]:
            yield num[-1]
        check_if_prime += 2

