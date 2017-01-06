# 1. Reverse the string

def reverse(str)
  reversed = ""

  str.each_char do |le|
    reversed = le + reversed
  end

  reversed
end

# 2. Factorial

def factorial(num)
  (1..num).reduce(1) do |product, n|
    product * n
  end
end


# 3. Longest Word

def longest_word(sen)
  words = sen.split
  word_longest = remove_punc(words.first)

  words.each do |word|
    word = remove_punc(word)
    if word_longest.length < word.length
      word_longest = word
    end
  end

  longest_word
end

def remove_punc(word)
  word.length.times do |idx|
    le = word[idx]
    if le == "&" || le == "!"
      return word[0...idx]
    end
  end
  word
end


# 4. LetterChanges
# Using the Ruby language, have the function letter_changes(str) take the str parameter being passed and modify it using the following algorithm. Replace every letter in the string with the letter following it in the alphabet (ie. c becomes d, z becomes a). Then capitalize every vowel in this new string (a, e, i, o, u) and finally return this modified string.


def letter_change(str)
  abc = ("a".."z").to_a
  vowels = %w(a e i o u)

  str.length.times do |i|
    pos = abc.index(str[i].downcase)
    str[i] = abc[(pos+1) % 26] unless pos.nil?
    str[i] = str[i].upcase if vowels.include?(str[i])
  end

  str
end



# 5. Sum up to num

def sumup(num)
  (1..num).reduce(0) { |sum, n| sum + n}
end

# 6. LetterCapitalize

def capitalize_string(str)
  str.split.map do |word|
    "#{word[0].upcase}#{word[1..-1]}"
  end.join(" ")
end
