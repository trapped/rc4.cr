require "./rc4/*"

class RC4
  def initialize(@key : Slice(UInt8))
    # initialize internal state
    i = j = 0
    @state = (0..255).to_a
    while i < 256
      j = (j + @state[i] + @key[i % key.size]) % 256
      @state[i], @state[j] = @state[j], @state[i]
      i += 1
    end
    @q1, @q2 = 0, 0
  end

  def stream(data : Slice(UInt8)) : Slice(UInt8)
    buffer = Slice(UInt8).new(data.size)
    i = 0
    while i < data.size
      @q1 = (@q1 + 1) % 256
      @q2 = (@q2 + @state[@q1]) % 256
      @state[@q1], @state[@q2] = @state[@q2], @state[@q1]
      buffer[i] = data[i] ^ @state[(@state[@q1] + @state[@q2]) % 256]
      i += 1
    end
    buffer
  end
end
