# Project 1: Caesar Cipher

def caesar_cipher(word, num)
	alphabet = ("a".."z").to_a
	cipher = []
	word_array = word.scan(/./)

	word_array.each do |letter|
		if alphabet.include? letter
			new_letter = (alphabet.index(letter) + num) % alphabet.length
			cipher << alphabet[new_letter]
		else
			cipher << letter
		end
	end
	puts cipher.join("")
	return cipher
end
puts "Please enter the sentence you wish to encrypt using caesar cipher"
word = gets.chomp.downcase

puts "Please enter the number of the shift (left) factor"
num = gets.chomp.to_i

caesar_cipher(word, num)
