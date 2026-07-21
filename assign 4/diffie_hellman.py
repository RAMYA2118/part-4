p = 29
g = 2

a = 5
b = 12

A = pow(g, a, p)
B = pow(g, b, p)

KA = pow(B, a, p)
KB = pow(A, b, p)

print("Diffie-Hellman Key Exchange")
print("Prime (p) =", p)
print("Primitive Root (g) =", g)
print("Alice Public Key =", A)
print("Bob Public Key =", B)
print("Shared Key (Alice) =", KA)
print("Shared Key (Bob) =", KB)

if KA == KB:
    print("Keys Match")
else:
    print("Keys Do Not Match")