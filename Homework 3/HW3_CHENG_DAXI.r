
library("openssl")
trans= "Cesare sends one bitcoin to Shimon"
htrans=sha256(trans)
h0="85738f8f9a7f1b04b5329c590ebcb9e425925c6d0984089c43a022de4f19c281"
ts= "2018-01-07 21:05:34"
bits="3"
nonce=0
aux=0
sol=0
while (aux!=1&nonce<=99999) {
  h1=paste(htrans, h0, ts, bits, toString(nonce))
  h2=sha256(h1)
  h3=substring(toString(h2),1,3)
  if (h3=='000') {
    aux=1
    sol=nonce
  }
  nonce=nonce+1
}
sol





