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
end
