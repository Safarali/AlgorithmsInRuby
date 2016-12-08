# 1.
# Write a method that given an array, returns another array with each of the
# numbers multiplied by two. Don't change the original array, make sure you
# construct a copy!

def array_times_two(array)
  doubled_arr = []

  array.each {|ele| doubled_arr << ele * 2}
  doubled_arr
end

# Now change the original array

def array_times_two!(array)
  array.each_with_index do |ele, idx|
      array[idx] = ele * 2
  end
  array
end

# 2. Sum all the numbers up to number

def sum_up_to(number)
  sum = 0

  (1..number).each do |num|
      sum += num
  end
  sum
end


# 3. Return another array with unique elements

def uniq(array)
  uniq_arr = []

  array.each do |ele|
    uniq_arr << ele unless uniq_arr.include?(ele)
  end
  uniq_arr
end


# 4. Slippery numbers
#A Slippery Number is a number is that has 3 as a factor or has 5 as a factor,
# but does *not* have both as factors. For example, 6 is a Slippery Number,
# but 30 is not. Write a method that given an integer n, returns an array of the
# first n Slippery numbers.

def slippery_numbers(n)
  slipperies = [];
  i = 3

  while slipperies.length < n
    if(i % 3 == 0 || i % 5 == 0)
      slipperies << i if i % 15  != 0
    end
    i += 1
  end
  slipperies
end

# 5. Magic numbers
# A magic number is a number whose digits, when added together, sum to 7. For
# example, the number 34 would be a magic number, because 3 + 4 = 7. Write a
# method that finds the first n many magic numbers.

def magic_numbers(n)
  magics = []
  i = 7

  while magics.length < n
      magics << i if(is_magic?(i))
      i += 1
  end
  magics
end


def is_magic?(number)
  number_str = number.to_s
  sum = 0

  number_str.each_char do |chr|
    sum += chr.to_i
  end
  sum == 7
end



# 6.
# Write a method that returns a phrase with each word (separated by spaces)
# capitalized.

def capitalize_each_word(phrase)
  words = phrase.split(" ")

  words.each_with_index do |word,idx|
    words[idx] = word.capitalize
  end
  words.join(" ")
end



# 7. palindrome?

def palindrome?(string)
  string.reverse == string
end

# 8. reverse digits

def reverse_digits(number)
  reversed = ""
  digits = number.to_s

  digits.each_char do |chr|
    reversed = chr + reversed
  end
  reversed.to_i
end

# 9. Longest word

def longest_word(phrase)
  words = phrase.split(" ")
  longest =  words.first

  words.each do |word|
    longest = word if longest.length < word.length
  end
  longest
end

# 10. Time Conversion

def time_conversion(minutes)
  hours = minutes / 60
  minutes = minutes % 60

  "#{'%02d' % hours}:#{'%02d' % minutes}"
end


# 11. Largest Pair
 # Write a method that takes an array of pairs and returns the pair with the
# greatest sum

def largest_pair(pairs)
  largest = pairs.first

  pairs.each do |pair|
    if largest.first + largest.last < pair.first + pair.last
      largest = pair
    end
  end
  largest
end

# 12. two_sum_to_zero?

def two_sum_to_zero?(array)
  (0...array.length).each do |i|
    (i+1).upto(array.length-1) do |j|
      return true if array[i] + array[j] == 0
    end
  end
  false
end

# 13. Third greatest

def third_greatest(array)
  first = nil
  second = nil
  third = nil

  array.each do |ele|
    if first.nil? || first < ele
      third = second
      second = first
      first = ele
    elsif second.nil? || second < ele
      third = second
      second = ele
    elsif third.nil? || third < ele
      third = ele
    end
  end

  third
end

# 14.
# Write a method that takes a string of words separated by spaces and returns a new
# string, identical to the original, but with five-letter words replaced by "#####".

def redact_five_letter_words(string)
  words = string.split(" ")

  words.each_with_index do |word, idx|
    words[idx] = "#####" if word.length == 5
  end
  words.join(" ")
end

# 15. Reverse array in place

def reverse(array)
  size = array.length / 2

  size.times do |i|
    array[i], array[-1 - i] = array[-1 - i], array[i]
  end
  array
end

# 16. All Uniqs
# Write a method, `#all_uniqs(array1, array2)` that, given two arrays, produces
# a new array of only elements unique to `array1` and elements unique to `array2`.
# Don't worry about the order of the elements in the output array.

def all_uniqs(arr1, arr2)
  uniqs = []

  arr1.each do |ele|
    unless uniqs.include?(ele)
      uniqs << ele unless arr2.include?(ele)
    end
  end

  arr2.each do |ele|
    unless uniqs.include?(ele)
      uniqs << ele unless arr1.include?(ele)
    end
  end
  uniqs
end

# 17.  e-words
# Define a method, #e_words(sentence), that accepts a sentence as an argument. Your
# method should count the number of words in the sentence that end with the letter "e".

def e_words(sentence)
  words = sentence.split(" ")
  count = 0

  words.each do |word|
    count += 1 if word[-1] == "e"
  end
  count
end

# 18. time_of_day
# Define a method, #time_of_day(time) that accepts a sting as an argument. Examples of
# valid arguments include: "12:30 PM", "1:00 AM", "8:15 PM". Your method should return
# the period of day that encompasses the provided time: "morning", "afternoon", or "evening".

# Use the following chart to categorize the times of day:
  #  12:00 AM - 11:59 AM  ==>  "morning"
  #  12:00 PM - 5:59 PM   ==>  "afternoon"
  #  6:00 PM - 11:59 PM   ==>  "evening"

  def time_of_day(time)
    if time.include?("AM")
      return "morning"
    elsif (time.include?("PM") && time[0].to_i <= 5) || time[0..1] == "12"
      return "afternoon"
    else
      return "evening"
    end
  end


# 19. fancy_sum?
# Define a boolean method, #fancy_sum?(array), that accepts an array as an argument. Your
# method should return true or false based on whether or not the array contains elements
# that follow the fancy sum pattern.

# The next element in the fancy sum series is determined by summing the previous element
# and the previous element's index

# Ex:  sum  -, 1+0, 1+1, 2+2, 4+3, 7+4, 11+5 ...
#       el  1,   1,   2,   4,   7,  11,   16 ...
#      idx  0,   1,   2,   3,   4,   5,    6 ...

# arrays can have any starting element


def fancy_sum?(array)
  array.each_with_index do |ele, idx|
    next if idx == 0

    prev_idx = idx - 1
    prev_sum =  prev_idx + array[prev_idx]

    return false unless ele == prev_sum
  end

  true
end


# 20. in_order?
# Define a boolean method, #in_order?(array), that accepts an array of integers
# as an argument. This method should return true if elements in the array are
# in order from smallest to largest (left to right), and false otherwise.

def in_order?(array)
  array.each_with_index do |ele, idx|
    next if idx == 0
    return false unless ele >= array[idx-1]
  end
  true
end

# 21. boolean_to_binary
# Define a method, #boolean_to_binary(array), that accepts an array of booleans as
# an argument. Your method should convert the array into a string made entirely
 # of 1s and 0s. A true should become a "1" and a false should become a "0".

def boolean_to_binary(booleans)
  binaries = ""
  booleans.each do |boolean|
      boolean == true ? binaries += "1" : binaries += "0"
  end
  binaries
end

# 22. More vowels
# Define a method, #more_vowels(string1, string2), that accepts two strings as
# arguments. Your method should return the string with more vowels. Return "tie"
# if the words have the same number of vowels.

def more_vowels(string1, string2)
  count_1 = count_vowels(string1)
  count_2 = count_vowels(string2)

  if count_1 > count_2
    return string1
  elsif count_1 == count_2
    return "tie"
  else
    return string2
  end
end

def count_vowels(string)
  vowels = "aeiou"
  count = 0

  string.each_char do |chr|
    count += 1 if vowels.include?(chr)
  end
  count
end


# 23.  Fibonacci Sequence
# The Fibonacci Sequence follows a simple rule: the next number in the sequence is the sum
# of the previous two. The sequence starts with [0, 1]. We then compute the 3rd
# number by summing the first & the second: 0 + 1 == 1. This yields [0, 1, 1]. We compute
# the 4th number by summing the second and the third: 1 + 1 == 2... and the pattern
# continues

def fibs(n)
  seq = [0, 1]
  next_ele = 1

  while seq.length < n
      seq.push(next_ele)
      next_ele = seq[-1] + seq[-2]
  end
  seq
end
