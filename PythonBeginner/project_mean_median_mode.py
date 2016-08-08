import math
import statistics as st
from decimal import Decimal

seq = input("Enter a sequence of numbers, separated by a space: ").split(" ")

sort = sorted(seq)

def mean(seq):
    count = 0
    for num in seq:
        count += int(num)
    return count / float(len(seq))

def median(seq):
    return st.median(map(Decimal, seq))

def mode(seq):
    pass

print(mean(sort), median(sort))
#print(math.floor(len(seq)/2), math.floor(len(seq)/2)+1)
