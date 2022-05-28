letters = ("a".."z")
vowels = ["a", "e", "i", "o", "u", "y"]
key = 0
hash = Hash.new { }

letters.each do |letter| key = key + 1
  vowels.each do |vowel|
    if vowel == letter
      hash [letter] = key
    end
  end
end

puts hash.inspect
