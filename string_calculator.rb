class StringCalculator
    def add(numbers)
        return 0 if numbers.empty?
        return numbers.to_i if numbers == numbers.to_i.to_s

        numbers.split(',').map(&:to_i).sum
    end
end