require 'minitest/autorun'
require_relative 'string_calculator'

class TestStringCalculator < Minitest::Test
    def setup
        @calc = StringCalculator.new
    end

    def test_return_zero_when_empty_string
        assert_equal 0, @calc.add("")
    end

    def test_return_same_when_single_number
        assert_equal 5, @calc.add("5")
    end

    def test_handles_sum_for_multiple_numbers
        assert_equal 20, @calc.add("5,5,10")
    end

    def test_handles_newline_for_multiple_numbers
        assert_equal 20, @calc.add("5\n5\n10")
    end

    def test_handles_newline_and_commas_for_multiple_numbers
        assert_equal 6, @calc.add("1\n2,3")
    end
end