require 'minitest/autorun'
require_relative 'string_calculator'

class TestStringCalculator < Minitest::Test
    def setup
        @calc = StringCalculator.new
    end

    def test_return_zero_when_empty_string
        assert_equal 0, @calc.add("")
    end
end