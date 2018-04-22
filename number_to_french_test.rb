require 'test/unit'
require "./number_to_french"

class NumberToFrenchTest < Test::Unit::TestCase
  def test_return_zero
    assert_equal 'zéro', translate_to_french(0)
  end

  def test_return_numbers_less_than_twenty
    assert_equal 'un', translate_to_french(1)
    assert_equal 'deux', translate_to_french(2)
    assert_equal 'trois', translate_to_french(3)
    assert_equal 'quatre', translate_to_french(4)
    assert_equal 'cinq', translate_to_french(5)
    assert_equal 'six', translate_to_french(6)
    assert_equal 'sept', translate_to_french(7)
    assert_equal 'huit', translate_to_french(8)
    assert_equal 'neuf', translate_to_french(9)
    assert_equal 'dix', translate_to_french(10)
    assert_equal 'onze', translate_to_french(11)
    assert_equal 'douze', translate_to_french(12)
    assert_equal 'treize', translate_to_french(13)
    assert_equal 'quatorze', translate_to_french(14)
    assert_equal 'quinze', translate_to_french(15)
    assert_equal 'seize', translate_to_french(16)
    assert_equal 'dix-sept', translate_to_french(17)
    assert_equal 'dix-huit', translate_to_french(18)
    assert_equal 'dix-neuf', translate_to_french(19)
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

  def test_return_number_below_70
    assert_equal 'vingt-deux', translate_to_french(22)
    assert_equal 'trente-trois', translate_to_french(33)
    assert_equal 'cinquante-quatre', translate_to_french(54)
    assert_equal 'soixante-neuf', translate_to_french(69)
  end

  def test_specific_et_un
    # traditional french use "vingt et un" with spaces, but since 1990 reform the rule is "vingt-et-un" with dashes.
    # and it is easier to do!
    assert_equal 'vingt-et-un', translate_to_french(21)
    assert_equal 'trente-et-un', translate_to_french(31)
    assert_equal 'quarante-et-un', translate_to_french(41)
    assert_equal 'cinquante-et-un', translate_to_french(51)
    assert_equal 'soixante-et-un', translate_to_french(61)
  end

  def test_specific_quatre_vingts
    # when not followed by anything, "vingts" is plural, with an "S"
    assert_equal 'quatre-vingts', translate_to_french(80)

    # when followed by another number, "vingt" is singular, without an "S"
    assert_equal 'quatre-vingt-deux', translate_to_french(82) # and not "quatre-vingts-deux"
    assert_equal 'quatre-vingt-quatre', translate_to_french(84)
    assert_equal 'quatre-vingt-neuf', translate_to_french(89)
  end

  def test_soixante_dix
    assert_equal 'soixante-douze', translate_to_french(72)
    assert_equal 'soixante-quatorze', translate_to_french(74)
    assert_equal 'soixante-dix-neuf', translate_to_french(79)
  end

  def test_quatre_vingt_dix
    assert_equal 'quatre-vingt-douze', translate_to_french(92)
    assert_equal 'quatre-vingt-quatorze', translate_to_french(94)
    assert_equal 'quatre-vingt-dix-neuf', translate_to_french(99)
  end

  def test_71_81_91_specific_rule_without_et
    assert_equal 'soixante-et-onze', translate_to_french(71) # should have a "et-"
    assert_equal 'quatre-vingt-un', translate_to_french(81) # should not have "et"
    assert_equal 'quatre-vingt-onze', translate_to_french(91) # should not have "et"
    assert_equal 'cent-un', translate_to_french(101) # should not have "et"
    assert_equal 'cent-quatre-vingt-onze', translate_to_french(191) # should not have "et"
    assert_equal 'deux-mille-cent-quatre-vingt-onze', translate_to_french(2191) # should not have "et"
  end

  def test_cent
    assert_equal 'cent', translate_to_french(100)
    assert_equal 'cent-quarante-cinq', translate_to_french(145)
  end

  def test_few_hundreds_and_something
    assert_equal 'deux-cent-cinq', translate_to_french(205)
    assert_equal 'neuf-cent-quatre-vingt-dix-neuf', translate_to_french(999)
  end

  def test_plural_cents
    assert_equal 'deux-cents', translate_to_french(200)
    assert_equal 'trois-cents', translate_to_french(300)
  end

  def test_mille
    assert_equal 'mille', translate_to_french(1000)
    assert_equal 'mille-quarante-cinq', translate_to_french(1045)
    assert_equal 'mille-cent-quarante-cinq', translate_to_french(1145)
  end

  def test_few_thousands_and_something
    assert_equal 'deux-mille-cinq', translate_to_french(2005)
    assert_equal 'neuf-mille-neuf-cent-quatre-vingt-dix-neuf', translate_to_french(9999)
  end

  def test_plural_milles
    assert_equal 'deux-milles', translate_to_french(2000)
    assert_equal 'trois-milles', translate_to_french(3000)
  end

  def test_dix_milles
    assert_equal 'dix-milles', translate_to_french(10000)
    assert_equal 'vingt-milles', translate_to_french(20000)
    assert_equal 'cent-cinquante-trois-mille-six-cent-vingt-deux', translate_to_french(153622)
    assert_equal 'neuf-cent-quatre-vingt-dix-neuf-mille-neuf-cent-quatre-vingt-dix-neuf', translate_to_french(999999)
  end

end
