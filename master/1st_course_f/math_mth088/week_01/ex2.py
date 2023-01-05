
a = [1,2,3,4,5]
t = 10

n = len(a)
s = n * [0]

def print_output():
    for i in range(n):
        if s[i] == 1:
            print(a[i], end=' ')
    print()

def sum():
    sum = 0
    for i in range(n):
        sum += a[i] * s[i]
    return sum

def enumerate(i):
    if i == n:
        if sum() == t:
            print_output()
    else:
        for c in [0,1]:
            s[i] = c
            enumerate(i+1)

enumerate(0)