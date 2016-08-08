# 99 bottles of beer on the wall, take one down, pass it around, 98 bottles of beer on the wall

count = 99
while count > 1:
    print(str(count) + " bottles of beer on the wall,")
    print(str(count) + " bottles of beer,")
    print("Take one down, pass it around,")
    count -= 1
    print(str(count) + " bottles of beer on the wall.")
    print("\n")
else:
    print(str(count) + " bottle of beer on the wall,")
    print(str(count) + " bottle of beer,")
    print("Take it down, pass it around,")
    count -= 1
    print("No more bottles of beer on the wall.")
