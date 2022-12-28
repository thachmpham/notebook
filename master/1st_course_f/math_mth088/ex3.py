
a = ['coc', 'xoai', 'oi', 'cam']
n = 2

b = []

def enumerate(k):
    if k == n:
        print(b)
    else:
        for x in a:
            if x not in b:
                b.append(x)
                enumerate(k+1)
                b.pop()

enumerate(0)