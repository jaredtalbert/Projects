tri = input("Input your triangle side lengths with spaces separating them: ")
ang = tri.split(" ")


def check(nums):
    hyp = 1
    for i in nums:
        if int(i) > hyp:
            hyp = int(i)
            
    ang.remove(str(hyp))
    a = ang[0]
    b = ang[1]
    
    if (int(a) ** 2) + (int(b) ** 2) == (int(hyp) ** 2):
        return True
    
    return False

print(check(ang))
