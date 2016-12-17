
# 1. alphabet_without
#Define a method, #alphabet_without(array), that accepts an array of letters as an argument.
#Your method should return an array of all the characters in the alphabet,
# but exclude the characters in the input array.

def alphabet_without(letters)
  alphabet = ("a".."z").to_a

  letters.each do |letter|
    alphabet.delete(letter)
  end

  alphabet
end

# 2. to_range

def to_range(array)
  min = array.min
  max = array.max
  (min..max)
end

# 3. words_lengths
# Write a method, #word_lengths(string) that, given a sentence,
# return a hash of each of the words and their lengths.
# Assume words are uniq in sentence

def word_lengths(sentence)
  words = sentence.split
  count = {}

  words.each do |word|
    count[word] = word.length
  end

  count
end


# 4. greatest_key_by_val

def greatest_key_by_val(hash)
  greatest = nil

  hash.each do |key, val|
    if(greatest.nil? || hash[greatest] < val)
      greatest = key
    end
  end

  greatest
end

# 5. odd_value_and_position

def odd_value_and_position(array)
  array.select.with_index do |ele, idx|
    ele.odd? && idx.odd?
  end
end

# 6. get_evens

def get_evens(array)
  array.select {|ele| ele.even?}
end

# 7. reject_odds

def reject_odds(array)
  array.reject {|ele| ele.odd?}
end

# 8. array_sum
# Define a method that accepts an array of numbers as an argument and uses #reduce to
# sum the numbers in an array.

def array_sum(numbers)
  numbers.reduce(0) {|sum, ele| sum + ele}
end

# 9. array_sum_with_index

def array_sum_with_index(array)
  array.each_with_index.reduce(0) do |sum, (ele, idx)|
    sum + ele * idx
  end
end

# 10. remove nth letter

def remove_nth_letter(string, n)
  "#{string[0...n]}#{string[n + 1..-1]}"
end

# 10. Third greatest

def third_greatest(array)
  array.sort[-3]
end


# 11. missing_letters

def missing_letters(string)
  ("a".."z").reject {|letter| string.include?(letter)}
end

# 12. update_inventory
# Define a method, #update_inventory(older, newer), that accepts two hashes as arguments. Update
# the older inventory with the newer inventory. Add any new items to the hash and replace
# the values for items that already exist.

def update_inventory(older, newer)
  newer.each do |key, value|
    older[key] = value
  end

  older
end



# 13. evens_and_odds

def evens_and_odds(numbers)
  count = {'even' => 0, 'odd' => 0}
  numbers.each do |ele|
    ele.even? ? count['even'] += 1 : count['odd'] += 1
  end

  count
end


# 14. chunk_array
# Define a method, #chunk(array, n), that chunks an array into nested sub-arrays of length n

def chunk(array, n)
  chunks = []
  a_chunk = []

  array.each_with_index do |ele, idx|
    a_chunk << ele
    if a_chunk.length == n || idx == array.length-1
      chunks << a_chunk
      a_chunk = []
    end
  end

  chunks
end

# 15. delete_first_letter
# Define a method that accepts a phrase and a letter as arguments. Your method should
# remove the first instance of that letter

def delete_first_letter(phrase, letter)
  return phrase unless phrase.include?(letter)

  letter_pos = phrase.index(letter)
  length = phrase.length

  "#{phrase[0...letter_pos]}#{phrase[(letter_pos + 1)...length]}"
end


# 16. largest_sum_pair
# Define a method that accepts an array of integers and returns the two unique indices
# whose elements sum to the largest number.

def largest_sum_pair(array)
idx1, idx2 = 0, 1

  array.length.times do |i|
    (i + 1).upto(array.length-1) do |j|
      if(array[idx1] + array[idx2]) < array[i] + array[j]
        idx1, idx2 = i, j
      end
    end
  end

  return [idx1, idx2]
end


# 17. most_common_vowel

def most_common_vowel(string)
  joined_str = string.split.join
  vowels = "aeiou"
  count = Hash.new(0)

  joined_str.each_char do |chr|
    count[chr] += 1 if vowels.include?(chr)
  end

  common = nil;
  count.each do |key, val|
    common = key if common.nil? || count[common] < val
  end

  common
end


# 18. Count word letters

def letter_counts(word)
  count = Hash.new(0)

  word.each_char do |chr|
    count[chr] += 1
  end

  count
end


# 19. Anagrams
# Define a method that accepts an array of words and returns only the words that are
# anagrams of a given string.

def anagrams(string, array)
  array.select do |word|
    anagram?(word, string)
  end
end

def anagram?(string1, string2)
  string1.chars.sort == string2.chars.sort
end
# 20. ordered_vowel_word?
# Define a boolean method that returns true if the vowels in a given word appear in order

def ordered_vowel_word?(word)
  vowels = "aeiou"
  word_vowels = []
  word.each_char do |chr|
    word_vowels << chr if vowels.include?(chr)
  end

  word_vowels.sort == word_vowels
end


# 21. non_unique_letters
# Define a method that accepts a string of lower case words (no punctuation) and returns
# an array of letters that occur more than once.  We'll need to account for spaces too.

def non_unique_letters(string)
  count = Hash.new(0)

  string.each_char do |chr|
    count[chr] += 1 unless chr == " "
  end

  count.keys.select do |letter|
    count[letter] > 1
  end
end

# 22. highest_prime_number

def highest_prime_factor(number)
  number.downto(2) do |factor|
    if number % factor == 0 && is_prime?(factor)
      return factor
    end
  end
  nil
end

def is_prime?(number)
  return false if number < 2
  (2...number).none? { |factor| number % factor == 0}
end

# 23. no_repeat_years
# Define a method that accepts two years and returns all the years within that range that
# have no repeated digits

def no_repeat_years(first_year, last_year)
  (first_year..last_year).select do |year|
    no_repeat_year?(year)
  end
end

def no_repeat_year?(year)
  str_year = year.to_s
  seen_chars = []

  str_year.each_char do |chr|
    return false if seen_chars.include?(chr)
    seen_chars << chr
  end
  true
end


# 24. count_adjacent_numbers
# Count the number of times that two adjacent numbers in an array add up to n.
# You cannot reuse a number. So count_adjacent_sums([1, 5, 1], 6) => 1

def count_adjacent_sums(array, n)
  count = 0
  idx = 0
  while idx < array.length - 1
    if array[idx] + array[idx+1] == n
      count += 1
      idx += 1
    end
    idx += 1
  end
  count
end


# 25. latinify
# Translate into pig-latin!
# The first consonants go to the end of the word, then add "ay"
# For the words starting with vowel or including no vowels, simply add "ay" at the end

def pig_latin(sentence)
  sentence.split.map do |word|
    latinify_word(word)
  end.join(" ")
end

def latinify_word(word)
  vowels = "aeiou"

  if(vowels.include?(word[0]))
    return "#{word}ay"
  else
    word.length.times do |idx|
      if vowels.include?(word[idx])
        return "#{word[idx..-1]}#{word[0...idx]}ay"
      elsif idx == word.length-1
        return "#{word}ay"
      end
    end
  end
end


# 26. repeated_number_ranges
# Given a list of numbers, give the start and end indices each time a number shows
# up multiple times in a row.


def repeated_number_ranges(numbers)
  ranges = []
  start_idx = 0

  numbers.each_with_index do |ele, idx|
    next_ele = numbers[idx + 1]
    unless ele == next_ele
      ranges << [start_idx, idx] unless start_idx == idx
      start_idx = idx + 1
    end
  end

  ranges
end


# 27. time_sums
# Return an array of all the minutes of the day whose digits sum to N.
# Use military time, so 1:00 PM is really 13:00.

def time_sums(n)
  times = []
  (0..23).each do |hour|
    (0..59).each do |minute|
      time = "#{'%02d' % hour}:#{'%02d' % minute}"
      times << time if time_sum(time) == n
    end
  end
  times
end


def time_sum(time)
  time.chars.reduce(0) do |sum, char|
    sum + char.to_i
  end
end


# 28. Fall and Winter Birthdays
# Given a list of students and what month their birthday is, return all the pairs
# of students whose birthdays both fall in the second half of the year.  Months
# are numbers, and assume that July (month 7) and later is the second half of
# the year.
#
# Only count pairs once, and work from the beginning of the list to the end.

=begin students_with_birthdays = {
  "Asher" => 6,
  "Bertie" => 11,
  "Dottie" => 8,
  "Warren" => 9
}

second_half_birthday_pairs_1 = [
  ["Bertie", "Dottie"],
  ["Bertie", "Warren"],
  ["Dottie", "Warren"]
]

=end

def fall_and_winter_birthdays(student_birthdays)
  students = student_birthdays.select  { |name, month| month >= 7 }
  results = []

  names = students.keys

  0.upto(names.length-1) do |idx|
    ((idx + 1)...names.length).each do |idx1|
      results << [names[idx], names[idx1]]
    end
  end

  results
end


# 29. Care Bear Summary
# You have a calendar of hugs that care bears made (given as a list of
# names by care bears).  Some of them have hugged multiple
# times in a row.
#
# Return a hash where the keys are the care bears and the values are an array
# of all of the start and end days of their hugging streaks.
#
# Days are the index of the calendar array.

=begin hug_calendar = [
  "Birthday Bear",
  "Birthday Bear",
  "Cheer Bear",
  "Bedtime Bear",
  "Bedtime Bear",
  "Birthday Bear",
  "Birthday Bear",
  "Birthday Bear",
  "Bedtime Bear",
  "Friend Bear"
]

care_bear_count = {
  "Birthday Bear" => [[0, 1], [5, 7]],
  "Bedtime Bear" => [[3, 4]]
}
=end

def care_bear_summary(hugs)
  counter = Hash.new{|key, value| key[value] = []}
  idx = 0

  while idx < hugs.length
    name = hugs[idx]
    last_hug_idx = last_hug(hugs, idx)

    unless last_hug_idx == idx
      counter[name] << [idx, last_hug_idx]
      idx = last_hug_idx
    end
    idx += 1
  end

  counter
end

# it gets the last  index with same value of idx before breaking streak.
# (["bear", "bear", "fox", "bear"], 0) outputs 1, not 3. Because streak broke by "fox"
def last_hug(hugs, idx)
  last_idx = idx

  (idx + 1).upto(hugs.length-1) do |idx1|
    if hugs[last_idx] == hugs[idx1]
      last_idx += 1
    else
      return last_idx
    end
  end
  last_idx
end
