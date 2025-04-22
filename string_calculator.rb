class StringCalculator
    def add(numbers)
        return 0 if numbers.empty?
        return numbers.to_i if numbers == numbers.to_i.to_s

        if numbers.start_with?("//")
            end_index = numbers.index("\n")
            new_delimiter = numbers[2...end_index]
            new_string = numbers[(end_index + 1)..]
            new_string.split(new_delimiter).map(&:to_i).sum
        else
            numbers.split(',').map{ |x| x.split("\n")}.flatten.map(&:to_i).sum
        end
    end
end