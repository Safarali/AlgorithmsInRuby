# 1. Two Degrees of Separation
# ------------------------------------------------------------------------------
# You have a hash that represents all of Facebook (lookit you).  Each key is the
# name of a person on facebook, and each value is an array of all their friends.
# Assume everyone on Facebook has a different name.
# Given Facebook and the name of a person, return an array of all the friends
# of their friends. Do not include the original person or their immediate friends.

=begin
facebook = {
  "Harry Potter" => ["Ron Weasley"],
  "Ron Weasley" => ["Harry Potter", "Fred Weasley"],
  "Fred Weasley" => ["Ron Weasley"]
}
friends = ["Fred Weasley"]
puts two_degrees_away(facebook_1, "Harry Potter") == friends_1
=end

def two_degrees_away(facebook, name)
  result = []

  facebook[name].each do |friend|
    facebook[friend].each do |sub_friend|
      unless sub_friend == name
        unless facebook[name].include?(sub_friend)
          result << sub_friend
        end
      end
    end
  end
  result
end


# 2. Assign Pods
# ------------------------------------------------------------------------------
# You are a JumpStart TA and you need to assign students to sit with other
# students who are at the same place in the curriculum.
#
# Given a list of students ordered by how far they are in the course and a
# list of pods, return their seat assignments.  Assume you can only seat four
# people per pod.  "Fill up" each pod as you go.  It's OK to have a pod with
# four people and the next pod with one person).  It's OK to have empty pods
# if there aren't enough students.


def assign_pods(students, pods)
  result = {}
  pod_idx = 0

  pods.each { |pod| result[pod] = []}

  students.each do |student|
    current_pod = pods[pod_idx]
    if result[current_pod].length == 4
      pod_idx += 1
      current_pod = pods[pod_idx]
    end

    result[current_pod] << student
  end
  result
end


# 3. For F's Sake
# ------------------------------------------------------------------------------
# Given a string, return the word that has the letter "f" closest to
# the end of it.  If there's a tie, return the earlier word.  Ignore punctuation.
# If there's no f, return an empty string.

def for_fs_sake(string)
  f_words = string.split.select { |word| word.include?("f") }
  return "" if f_words.empty?

  f_words.map! { |word| purify_word(word) }
  f_words.min_by { |word| word.reverse.index("f") }
end


def purify_word(word)
  word.delete("?,!.")
end


# 4. # Censor
# ------------------------------------------------------------------------------
# Write a function censor(sentence, curse_words) that censors the words given.
# Replace the vowels in the curse word with "*".

#puts censor("Schnikeys I don't give a diddly squat", ["schnikeys", "diddly", "squat"]) == "Schn*k*ys I don't give a d*ddly sq**t"


def censor(sentence, curse_words)
  sentence.split.map do |word|
    if curse_words.include?(word.downcase)
      asteriksfy(word)
    else
      word
    end
  end.join(" ")
end

def asteriksfy(word)
  vowels = "aeiou"
  word.chars.each_index do |idx|
    word[idx] = "*" if vowels.include?(word[idx].downcase)
  end
  word
end


# 5. Total Product Sequence
# ------------------------------------------------------------------------------
# The total product sequence starts with [1, 2, 3] as a "base case" (what you
# start with).  The next number in the sequence is the product of all the numbers
# before it.  Given a number n, find the nth number of the total product sequence.
# Assume n must be at least 1
# puts total_product_sequence(4) == 6 # 3 * 2 * 1

def total_product_sequence(n)
  seq = [1, 2, 3]
  while seq.length < n
    seq << product(seq)
  end
  seq[n-1]
end

def product(numbers)
  numbers.reduce(1) { |product, num| product * num }
end
