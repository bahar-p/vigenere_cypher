class VigenereCypher

  def initialize(key, message)
    raise ArgumentError, 'Message can only contain letters' unless valid?(message)
    raise ArgumentError, 'Key can only contain letters' unless valid?(key)

    @message = message.upcase
    @key = pad_cypher_key(key).upcase
    @alphabets = ('A'..'Z').to_a
  end

  def encrypt
    encrypted_message = ''
    char_index = 0

    message.each_char do |char|
      aligned_key_char = key[char_index]
      cyphered_char_index = alphabets.index(aligned_key_char) + alphabets.index(char)
      encrypted_message += alphabets[cyphered_char_index % 26]
      char_index += 1
    end

    encrypted_message
  end

  def decrypt
    decrypted_message = ''
    char_index = 0

    message.each_char do |char|
      aligned_key_char = key[char_index]
      cyphered_char_index = alphabets.index(char) - alphabets.index(aligned_key_char)
      decrypted_message += alphabets[cyphered_char_index % 26]
      char_index += 1
    end
    decrypted_message
  end


  private

  def pad_cypher_key(key)
    message_length = message.length
    return key if message_length == key.length

    updated_key = key
    if key.length > message_length
      updated_key = key[0...message_length]
    else
      while updated_key.length < message_length
        padding_length = message_length - updated_key.length
        padding_text = key[0...padding_length]
        updated_key += padding_text
      end
    end

    updated_key
  end

  def valid?(text)
    text.match?(/\A[A-Za-z]+\z/)
  end

  private

  attr_reader :key, :message, :alphabets

end