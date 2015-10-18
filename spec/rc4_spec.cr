require "./spec_helper"
require "random"

describe RC4 do
  it "should encrypt and decrypt password 'super-cool-test' with key 'nuff rspec'" do
    key = "nuff rspec"
    enc = RC4.new(key.to_slice)
    encrypted = enc.stream("super-cool-test".to_slice)

    dec = RC4.new(key.to_slice)
    decrypted = dec.stream(encrypted)
    String.new(decrypted).should eq "super-cool-test"
  end

  it "should encrypt and decrypt password 'if-I-was-a-bit' with key 'bitsnbytes'" do
    enc = RC4.new("bitsnbytes".to_slice)
    dec = RC4.new("bitsnbytes".to_slice)

    encrypted = enc.stream("if-I-was-a-bit".to_slice)
    decrypted = dec.stream(encrypted)
    String.new(decrypted).should eq "if-I-was-a-bit"
  end
end
