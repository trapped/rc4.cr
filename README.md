## RC4 implementation for [Crystal](http://crystal-lang.org)
Adapted from [`ruby/rc4`](https://github.com/henrik/ruby-rc4)
Usage (after adding to shard.yml):
```crystal
require "rc4"

key = "your key".to_slice
data = "some data".to_slice

# to encrypt
rc4_enc = RC4.new key
encrypted = rc4_enc.stream data # Slice(UInt8)

# to decrypt
rc4_dec = RC4.new key
decrypted = rc4_dec.stream data

encrypted == decrypted # true
