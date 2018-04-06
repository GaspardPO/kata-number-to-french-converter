require 'test/unit'
require "./number_to_french"

class NumberToFrenchTest < Test::Unit::TestCase
  def test_return_units
    assert_equal'zero',  translate_to_french(0)
    assert_equal'un',  translate_to_french(1)
    assert_equal'deux',  translate_to_french(2)
    assert_equal'trois',  translate_to_french(3)
    assert_equal'quatre',  translate_to_french(4)
    assert_equal'cinq',  translate_to_french(5)
    assert_equal'six',  translate_to_french(6)
    assert_equal'sept',  translate_to_french(7)
    assert_equal'huit',  translate_to_french(8)
    assert_equal'neuf',  translate_to_french(9)
  end
end