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

    def test_handles_custom_delimiter
        assert_equal 3, @calc.add("//;\n1;2")
    end

    def test_return_same_when_single_number_with_custom_delimiter
        assert_equal 1, @calc.add("//;\n1")
    end

    def test_single_negative_numbers_throw_exception_with_message
        assert_raises(RuntimeError, "negatives not allowed: -1") { @calc.add("-1") }
    end

    def test_multiple_negative_numbers_throw_exception_with_message
        assert_raises(RuntimeError, "negatives not allowed: -1, -3") { @calc.add("-1,2,-3") }
    end

    def test_multiple_negative_with_newline_numbers_throw_exception_with_message
        assert_raises(RuntimeError, "negatives not allowed: -3") { @calc.add("1\n2,-3") }
    end

    def test_multiple_negative_with_delimiter_numbers_throw_exception_with_message
        assert_raises(RuntimeError, "negatives not allowed: -2") { @calc.add("//;\n1;-2") }
    end

end