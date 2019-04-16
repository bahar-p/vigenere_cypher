require 'minitest/autorun'
require_relative '../vigenere_cypher'

class VinegereCypherTest < MiniTest::Test

  def test_invalid_message
    assert_raises ArgumentError do
      VigenereCypher.new('LEMONLEMONLEMON', 'AT.TAC&KAT)DA-WN')
    end
  end

  def test_invalid_key
    assert_raises ArgumentError do
      VigenereCypher.new('L@6ON-0', 'ATTACKATDAWN')
    end
  end

  def test_encrypt
    vigenere_cypher = VigenereCypher.new('LEMONLEMONLEMON', 'ATTACKATDAWN')
    assert_equal 'LXFOPVEFRNHR', vigenere_cypher.encrypt
  end

  def test_decrypt
    vigenere_cypher = VigenereCypher.new('LEMONLEMONLEMON', 'LXFOPVEFRNHR')
    assert_equal 'ATTACKATDAWN', vigenere_cypher.decrypt
  end

end