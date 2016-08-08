def fib(num):
    seq = [0]
    if num == 0:
        return 0
    elif num == 1:
        return 1
    else:
        for i in range(int(num)+1):
            seq. = int(seq[i-2]+seq[i-1])

print(fib(input()))
