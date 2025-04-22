class StringCalculator
    def add(numbers)
        return 0 if numbers.empty?
        return numbers.to_i if numbers == numbers.to_i.to_s && numbers.to_i.positive?

        if numbers.start_with?("//")
            end_index = numbers.index("\n")
            new_delimiter = numbers[2...end_index]
            new_string = numbers[(end_index + 1)..]
            nums = new_string.split(new_delimiter).map(&:to_i)
        else
            nums = numbers.split(',').map{ |x| x.split("\n")}.flatten.map(&:to_i)
        end

        negative_numbers = nums.select(&:negative?)
        raise "negative numbers not allowed #{negative_numbers.join(',')}" unless negative_numbers.empty?

        nums.sum
    end
end