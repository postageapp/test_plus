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
end
