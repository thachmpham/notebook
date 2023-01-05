
n = 5
s = 5 * [0]

def enumerate(i):
    if i == n:
        print(s)
    else:
        for c in [0,1]:
            s[i] = c
            enumerate(i+1)
            
enumerate(0)