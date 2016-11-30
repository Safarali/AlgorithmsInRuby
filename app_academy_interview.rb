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
    return false if number < 1 || num <= 1
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
