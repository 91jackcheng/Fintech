

# Part 0
rm(list = ls())
library("openssl")
# Part 1
p=bignum("112481050639317229656723018120659623829736571015511322021617837187076258724819")
q=bignum("89185111938335771293328323333111422985697062149139368049232365065924632677343")
## Get public keys
N=p*q
e=bignum("65537")
print("The public key is")
print(c(N,e))
## Get private keys
d=bignum_mod_inv(e,(p-1)*(q-1)) 
print("The private key is")
print(c(N,d))
# Part 2
message="Running late. Wait for me."
m= bignum(charToRaw(message))
c=base64_encode(bignum_mod_exp(m,e,N))
print("The 64base encrypt message is")
c
# Part 3
c_friend="rGhkBLUmPQStyYGrhIcNxnhZw6GeGoFGswZuUihd+kPx21VtPSMmdBRQOkKw8uLPhsh0NV4qk27G/EFuVT2iAw=="
c3=bignum(base64_decode(c_friend))
M=rawToChar(bignum_mod_exp(c3,d,N))
print("The decrypted message is")
print(M)
# Part 4
m_hash=bignum(charToRaw(sha256(M)))
s=bignum_mod_exp(m_hash,d,N)
print("The Signature message is")
print(m_hash)
print("The Signature is")
print(s)

# Part 5
M1=bignum_mod_exp(s,e,N)
print("The Verified Signature message is")
print(M1)
print("The Original Signature message was")
print(m_hash)
### judge if they are the same
m_hash==bignum_mod_exp(s,e,N)

