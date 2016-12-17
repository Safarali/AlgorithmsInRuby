# 1. Isogram Matcher
# An isogram is a word with only unique, non-repeating letters. Given two isograms
# of the same length, return an array with two numbers indicating matches:
# the first number is the number of letters matched in both words at the same position,
# and the second is the number of letters matched in both words but not in the
# same position

def isogram_matcher(isogram1, isogram2)
  idx_match = 0
  letter_match = 0

  isogram1.length.times do |i|
    if isogram1[i] == isogram2[i]
      idx_match += 1
    elsif isogram2.include?(isogram1[i])
      letter_match += 1
    end
  end
  [idx_match, letter_match]
end


# 2. Panoramic pairs
# You have a panoramic view in front of you, but you only can take a picture of
# two landmarks at a time (your camera is small).  You want to capture every
# pair of landmarks that are next to each other.
#
# Given an array of landmarks, return every adjacent pair from left to right.
# Assume the panorama wraps around.

# landmarks = ["House", "Horse"]
# pairs = [["House", "Horse"], ["Horse", "House"]]


def panoramic_pairs(landmarks)
  pairs = []

  landmarks.each_with_index do |landmark, idx|
    next_landmark = landmarks[(idx + 1) % landmarks.length]
    pairs << [landmark, next_landmark]
  end
  pairs
end


# 3. Xbonacci
# Write a Xbonacci function that works similarly to the fibonacci sequence.
# The fibonacci sequence takes the previous two numbers in the sequence and adds
# them together to create the next number.
#
# First five fibonacci numbers = [1, 1, 2, 3, 5]
# The fourth fibonacci number (3) is the sum of the two numbers before it
# (1 and 2).
#
# In Xbonacci, the sum of the previous X numbers (instead of the previous 2 numbers)
# of the sequence becomes the next number in the sequence.
#
# The method will take two inputs: the starting sequence with X number of
# elements and an integer N, and return the first N elements in the given
# sequence.  Take a look at the test cases for examples.

def xbonacci(starting_seq, n)
  slice_idx = starting_seq.length
  last_x_ele = starting_seq[-slice_idx..-1]

  while starting_seq.length < n
    starting_seq << sum(last_x_ele)
    last_x_ele = starting_seq[-slice_idx..-1]
  end

  starting_seq
end

def sum(array)
  array.reduce(0) {|sum, ele| sum + ele}
end



# 4. remove_letter_a
# Given a list of words, remove all the occurrences of the letter 'a' in those words

def remove_letter_a(words)
  words.map do |word|
    word.gsub("a", "")
  end
end

# 5. abundant?
# An abundant number is a number that is less than the sum of its divisors,
# not including itself.

def abundant?(number)
  sum = 0
  (1...number).each do |num|
    sum += num if number % num == 0
    return true if sum > number
  end

  false
end

# 6.  greatest_common_factor

def greatest_common_factor(num1, num2)
  i = [num1, num2].min

  while true
    if num1 % i == 0 && num2 % i == 0
      return i
    end
     i -= 1
  end
end

# 7. word_with_most_repeats
# Given a sentence, find which word has the greatest amount of repeated letters.
# For example, "I took the road less traveled and that has made all the difference"
# should return "difference" because it has two repeated letters (f and e)

def word_with_most_repeats(sentence)
  sentence.split.max_by do |word|
    number_of_repeats(word)
  end
end

def number_of_repeats(word)
  counter = Hash.new(0)

  word.chars.each do |chr|
    counter[chr] += 1
  end

  counter.count {|letter,times| times > 1}
end

# 8. in_all_strings
# Check if a short_string is a substring off ALL of the long_strings

def in_all_strings?(long_strings, short_string)
  long_strings.all? do |word|
    word.include?(short_string)
  end
end

# 9. For C's Sake

# Given a string, return the word that has the letter "c" closest to
# the end of it.  If there's a tie, return the earlier word.  Ignore punctuation.
# If there's no "c", return an empty string

def for_cs_sake(sentence)
  c_words = sentence.split.select {|word| word.downcase.include?("c")}
  return "" if c_words.empty?

  c_words.map! { |word| purify_word(word) }
  c_words.min_by { |word| word.reverse.index("c") }
end

def purify_word(word)
  word.delete("?,!.")
end

# 10. first_last_indices
# Write a functinon that takes a string and
# returns a hash in which each key is a character in the string
# pointing to an array indicating the index that the character
# first occurs and last occurs.
# If the character occurs only once, the array should hold a single index

def first_last_indices(string)
  result = {}

  string.each_char do |letter|
    first_idx = string.index(letter)
    last_idx = string.rindex(letter)

    result[letter] = [first_idx]
    result[letter] << last_idx unless first_idx == last_idx
  end

  result
end


# 11. price is right# Given a list of bids and an actual retail price, return the bid that is closest
# to the actual retail price without going over that price.
# Assume there is always at least one bid below the retail price.
# puts price_is_right([200, 2350, 1400, 1600], 1599) == 1400
# puts price_is_right([950, 850, 1000, 1], 1300) == 1000
# puts price_is_right([1499, 1500, 1501], 1500) == 1500


def price_is_right(bids, actual_price)
  bids.sort.reverse.each do |bid|
    return bid if bid <= actual_price
  end
end


# 12. product except me
# Given an array of numbers, calculate all the different products that remain when you take each element out of the array.
# Ex.
# [2, 3, 4] => [12, 8, 6], where:
#   12 because you take out 2, leaving 3 * 4
#   8, because you take out 3, leaving 2 * 4
#   6, because you take out 4, leaving 2 * 3

def products_except_me(numbers)
  numbers.map do |num|
    temp = num
    productify(numbers)/temp
  end
end

def productify(array)
  array.reduce(1) { |result, ele| result * ele}
end

# 13. at_least_n_factors

# Given an array of numbers, return all the numbers that have at least N
# factors (including 1 and itself as factors).
# For example, if you were given [1, 3, 10, 16] and wanted to find the numbers
# that had at least five factors, you would return [16] because 16 has five
# factors (1, 2, 4, 8, 16) and the others have fewer than five factors.


def at_least_n_factors(numbers, n)
  numbers.select do |num|
    number_of_factors(num) >= n
  end
end

def number_of_factors(number)
  (1..number).count do |factor|
    number % factor == 0
  end
end


# 14.  Every Third Sum
# Define a method, #every_third_sum(array), that accepts an array of integers as
# an argument. Your method should return the sum of every third element

def every_third_sum(array)
  sum = 0

  array.each_with_index do |ele, idx|
    sum += ele if (idx + 1) % 3 == 0
  end
  sum
end

# 15. character_by_character
# Define a method, #character_by_character(string) that accepts a string as an argument.
# Your method should return an array of all the substrings that make up string,
# starting with the first character.
# ex: character_by_character("ruby") ==> ["r", "ru", "rub", "ruby"]

def character_by_character(string)
  sub_strings = []
  string.chars.each_index do |idx|
    sub_strings << string[0..idx]
  end
  sub_strings
end


# 15.
# Define a method, #lcts(array), that accepts an array of integers as an argument.
# Your method should return the largest sum that can be made by summing two consecutive numbers
# ex: lcts([1, 5, 6, 2, 2, 7]) ==> 5 + 6 ==> 11

def lcts(array)
  max = array[0] + array[1]
  (array.length-1).times do |idx|
    sum = array[idx] + array[idx + 1]
    if max < sum
      max = sum
    end
  end
  max
end
