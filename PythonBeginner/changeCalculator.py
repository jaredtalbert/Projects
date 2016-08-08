import math

while True:
    total = input("Receipt total: ")
    given = input("Cash given: ")
    difference = round(float(given) - float(total), 2)

    rdollars = math.floor(difference)
    qtotal =  difference - rdollars
    rquarters = qtotal // 0.25
    dtotal =  qtotal - (rquarters * 0.25)
    rdimes = dtotal // 0.10
    ntotal = dtotal - (rdimes * 0.10)
    rnickels = ntotal // 0.05
    ptotal = ntotal - (rnickels * 0.05)
    rpennies = ptotal // 0.01

    print("Total change: %s" % difference)
    print("Dollars as change: %s" % rdollars)
    print("Quarters as change: %s" % rquarters)
    print("Dimes as change: %s" % rdimes)
    print("Nickels as change: %s" % rnickels)
    print("Pennies as change: %s" % rpennies)
