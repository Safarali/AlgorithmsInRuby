# Define a method which takes an array, prints all combinations of  ele1 & ele2  where ele2 > ele1 and ele2 - ele1 = Array.min

def closestNumbers(numbers)
    numbers = numbers.sort
    min = minDiffer(numbers)
    numbers.length.times do |i|
        (i + 1).upto(numbers.length-1) do |j|
            if numbers[j] - numbers[i] == min
                puts "#{numbers[i]} #{numbers[j]}"
            end
        end
    end
end

def minDiffer(numbers)
    numbers = numbers.sort

    min = numbers.max - numbers.min

    numbers.each_index do |i|
        (i + 1).upto(numbers.length-1) do |j|
            if numbers[j] > numbers[i]
                if min > numbers[j] - numbers[i]
                    min = numbers[j] - numbers[i]
                end
            end
        end
    end
    min
end
