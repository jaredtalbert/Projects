import math

w_penny = 2.5
w_nickel = 5.0
w_dime = 2.268
w_quarter = 5.670

c_penny = 50
c_nickel = 40
c_dime = 50
c_quarter = 40

u_w_penny = float(input("Weight of pennies?: "))
u_w_nickel = float(input("Weight of nickels?: "))
u_w_dime = float(input("Weight of dimes?: "))
u_w_quarter = float(input("Weight of quarters?: "))

def count_coins(p, n, d, q):
    # Count
    count_pennies = round((p/w_penny))
    count_nickels = round((n/w_nickel))
    count_dimes = round((d/w_dime))
    count_quarters = round((q/w_quarter))

    # Sleeve
    sleeve_pennies = math.ceil(count_pennies/c_penny)
    sleeve_nickels = math.ceil(count_nickels/c_nickel)
    sleeve_dimes = math.ceil(count_dimes/c_dime)
    sleeve_quarters = math.ceil(count_quarters/c_quarter)

    # Total
    total_pennies = round((p/w_penny) * 0.01, 2)
    total_nickels = round((n/w_nickel) * 0.05, 2)
    total_dimes = round((d/w_dime) * 0.10, 2)
    total_quarters = round((q/w_quarter) * 0.25, 2)
    total_all = total_pennies + total_nickels + total_quarters

    print("You have about %s pennies, %s nickels, %s dimes, and %s quarters." % (str(count_pennies), str(count_nickels), str(count_dimes), str(count_quarters)))
    print("You will need %s penny wrappers, %s nickel wrappers, %s dime wrappers, and %s quarter wrappers." % (sleeve_pennies, sleeve_nickels, sleeve_dimes, sleeve_quarters))
    print("Penny value: $%s \nNickel Value: $%s \nDime value: $%s \nQuarter value: $%s \nTotal value: $%s" % (total_pennies, total_nickels, total_dimes, total_quarters, total_all))

count_coins(u_w_penny, u_w_nickel, u_w_dime, u_w_quarter)
