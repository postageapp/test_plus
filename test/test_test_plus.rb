require_relative './helper'

class TestTestPlus < Test::Unit::TestCase
  def test_assert_mapping
    assert_mapping(
      'a' => 'A',
      'A' => 'A',
      nil => nil
    ) do |letter|
      letter and letter.upcase
    end
  end

  def test_assert_exception_raised
    assert_exception_raised ArgumentError do
      ''.to_s(1)
    end
  end

  def test_assert_equal_reduced
    a = [ 1, 2, 3, 4, 5 ]
    b = %w[ 1 2 3 4 5 ]

    assert_equal_reduced(a, b, :to_s)

    assert_equal_reduced(a, b, ->(v) { v.to_s })
  end
end
