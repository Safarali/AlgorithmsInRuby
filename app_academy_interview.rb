# 00. Reverse the string

def reverse(str)
    reversed_str = "";
    i = 0
    while i < str.length
        reversed_str = str[i] + reversed_str
        i += 1
    end
    reversed_str
end

# 01. Factorial

def factorial(num)
    product = 1
    i = num
    while i > 0
        product *= i
        i -= 1
    end
    product
end

# 02. Longest world

def longest_word(phrase)
    words = phrase.split(" ")
    longest = words.first

    i = 0
    while i < words.length
        if longest.length < words[i].length
            longest = words[i]
        end
        i += 1
    end
    longest
end

# 03. Sum up to num

def sum_nums(num)
    sum = 0

    i = 1
    while i <= num
        sum += i
        i += 1
    end
    sum
end

# 04. Time conversion

def time_conversion(minutes)
    hour = (minutes / 60).to_s
    minutes = minutes % 60

    if(minutes < 10)
        minutes = "0#{minutes}"
    else
        minutes = minutes.to_s
    end
    "#{hour}:#{minutes}"
end


# 05. Count Vowels

def count_vowels(str)
    vowels = ["a", "e", "i", "o", "u"]
    count = 0

    i = 0
    while i < str.length
        if vowels.include?(str[i])
            count += 1
        end
        i += 1
    end
    count
end

# 06. is_Palindrome?

def palindrome?(string)
    string == reverse(string)
end


# 07. nearby_az

def nearby_az(string)
    i = 0
    while i < string.length
        chr = string[i]
        if chr == "a" && string[i..i+3].include?("z")
            return true
        end
        i += 1
    end
    false
end

# 08. Two sum is zero?

def two_sum(nums)
    i = 0
    while i < nums.length
        j = i + 1
        while j < nums.length
            if nums[i] + nums[j] == 0
                return [i, j]
            end
            j += 1
        end
        i += 1
    end
    nil
end


# 09. is number power of num?

def is_power_of?(number, num)
    return true if number == 1 && num == 1
    return false if number < 1 ||  num <= 1
    while true
        if number == 1
            return true
        elsif number % num == 0
            number = number / num
        else
            return false
        end
    end
end

# 10. Third greatest value in array

def third_greatest(numbers)
    first = nil
    second = nil
    third = nil

    idx = 0
    while idx < numbers.length
        val = numbers[idx]

        if first == nil || first < val
            third = second
            second = first
            first = val
        elsif second == nil || second < val
            third = second
            second = val
        elsif third == nil || third < val
            third = val
        end

        idx += 1
    end
    third
end


# 11. Most common letter in string

def most_common_letter(string)
    count = Hash.new(0)

    idx = 0
    while idx < string.length
        chr = string[idx]
        if chr != " "
            count[chr] += 1
        end
        idx += 1
    end
    common = string[0]
    count.keys.each do |key|
        if count[common] < count[key]
            common = key
        end
    end
    [common, count[common]]
end


# 12. Dasherize
=begin  Write a method that takes in a number and returns a string, placing
# a single dash before and after each odd digit. There is one
# exception: don't start or end the string with a dash.
=end

def dasherize(num)
    digits = num.to_s
    dasherized = ""

    idx = 0
    while idx < digits.length
        digit = digits[idx].to_i

        if (idx > 0)
            prev_digit = digits[idx-1].to_i
            if (prev_digit % 2 == 1 || digit % 2 == 1)
                dasherized += "-"
            end
        end
        dasherized += digits[idx]

        idx += 1
    end
    dasherized
end


# 13. Capitalize words

def capitalize_words(string)
    words = string.split(" ")
    capitalized = []

    idx = 0
    while idx < words.length
        word = words[idx]
        capitalized << word.capitalize
        idx += 1
    end
    capitalized.join(" ")
end

# 14. Scramble string

def scramble_string(str, positions)
    scrambled = ""

    idx = 0
    while idx < positions.length
        pos = positions[idx]
        scrambled += str[pos]

        idx += 1
    end
    scrambled
end


# 15. is Prime

def is_prime?(num)
    return false if num < 2

    i = 2
    while i < num
        return false if num % i == 0
        i += 1
    end
    true
end

# 16. nth_prime

def nth_prime(n)
    count = 0

    i = 2
    while true
        if(is_prime?(i))
            count += 1
            return i if count == n
        end
        i += 1
    end
end


# 17. Longest palindrome

def longest_palindrome(str)
    longest = str[0]

    idx = 0
    while idx < str.length
        idx1 = str.length-1
        while idx1 > idx
            word = str[idx..idx1]
            if(palindrome?(word))
                if longest.length < word.length
                    longest = word
                end
            end
            idx1 -= 1
        end
        idx += 1
    end
    longest
end

# 18. Most Common Factor

def most_common_factor(num, num1)
    i = nil
    num > num1 ? i = num1 : i = num

    while true
        if(num % i == 0 && num1 % i == 0)
            return i
        end
        i -= 1
    end
end


# 19. Caesar Cipher, shift letter by given offset. DO it by ASCII. "a".ord = 97, 122.chr = "z"
def caesar_cipher(offset, str)
    shifted = ""

    idx = 0
    while idx < str.length
        pos = str[idx].ord
        abc_pos = pos % "a".ord
        shifted_pos = (abc_pos + offset) % 26 + "a".ord

        if(str[idx] != " ")
            shifted += shifted_pos.chr
        else
            shifted += str[idx]
        end
        idx += 1
    end
    shifted
end

# 20. Count Letters that appear more than 1 .

def num_repeats(string)
    count = Hash.new(0)

    idx = 0
    while idx < string.length
        chr = string[idx]
        count[chr] += 1

        idx += 1
    end
    repeats = 0

    count.values.each do |value|
        repeats += 1 if value > 1
    end
    repeats
end
