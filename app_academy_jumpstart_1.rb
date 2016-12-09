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
