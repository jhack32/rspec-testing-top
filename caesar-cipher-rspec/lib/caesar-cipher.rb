# Project 1: Caesar Cipher

def caesar_cipher(word, num)
	alphabet = ("a".."z").to_a
	capital_letters = ("A".."Z").to_a
	cipher = []
	word_array = word.scan(/./)

	word_array.each_with_index do |letter, index|
		if alphabet.include? letter
			new_letter = (alphabet.index(letter) + num) % alphabet.length
			if word_array[index] == word_array[index].upcase
				cipher << alphabet[new_letter].upcase
			else
				cipher << alphabet[new_letter]
			end
		elsif capital_letters.include? letter
			new_letter = (capital_letters.index(letter) + num) % capital_letters.length
			cipher << capital_letters[new_letter]
		else
			cipher << letter
		end
	end
	return cipher.join("")
end
puts "Please enter the sentence you wish to encrypt using caesar cipher"
word = gets.chomp

puts "Please enter the number of the shift (left) factor"
num = gets.chomp.to_i

puts caesar_cipher(word, num)
