from math import gcd

p = 3
q = 11
e = 3
m = 4

n = p * q
phi = (p - 1) * (q - 1)

d = 0
for i in range(1, phi):
    if (e * i) % phi == 1:
        d = i
        break

c = pow(m, e, n)
decrypted = pow(c, d, n)

print("RSA Implementation")
print("p =", p)
print("q =", q)
print("n =", n)
print("phi =", phi)
print("e =", e)
print("d =", d)
print("Original Message =", m)
print("Encrypted Message =", c)
print("Decrypted Message =", decrypted)