#maxV = int(input("Input max value: "))

maxV = 9

for x in range(1, maxV+1):
    for i in range(1, maxV+1):
        print(str(i*x).rjust(maxV, " "), end="")

    

