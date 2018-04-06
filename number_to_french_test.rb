require 'test/unit'
require "./number_to_french"

class NumberToFrenchTest < Test::Unit::TestCase
  def test_return_zero
    assert_equal 'zero', translate_to_french(0)
  end

  def test_return_units
    assert_equal 'un', translate_to_french(1)
    assert_equal 'deux', translate_to_french(2)
    assert_equal 'trois', translate_to_french(3)
    assert_equal 'quatre', translate_to_french(4)
    assert_equal 'cinq', translate_to_french(5)
    assert_equal 'six', translate_to_french(6)
    assert_equal 'sept', translate_to_french(7)
    assert_equal 'huit', translate_to_french(8)
    assert_equal 'neuf', translate_to_french(9)
  end

  def test_return_tens
    assert_equal 'dix', translate_to_french(10)
    assert_equal 'vingt', translate_to_french(20)
    assert_equal 'trente', translate_to_french(30)
    assert_equal 'quarante', translate_to_french(40)
    assert_equal 'cinquante', translate_to_french(50)
    assert_equal 'soixante', translate_to_french(60)
    assert_equal 'soixante-dix', translate_to_french(70) # french style, not Belgian nor Suiss.
    assert_equal 'quatre-vingts', translate_to_french(80)
    assert_equal 'quatre-vingt-dix', translate_to_french(90)
  end

end