ZERO = 'zéro'.freeze

class Number
  BASIC_UNITS = %w[deux trois quatre cinq six sept huit neuf].freeze
  UNITS_AS_STRING = ([ZERO, 'et-un'] +
                     BASIC_UNITS +
                     ['dix', 'et-onze', 'douze', 'treize', 'quatorze', 'quinze',
                      'seize', 'dix-sept', 'dix-huit', 'dix-neuf']).freeze
  TENS_AS_STRING = [ZERO, 'dix', 'vingt', 'trente', 'quarante', 'cinquante',
                    'soixante', 'soixante-dix', 'quatre-vingt', 'quatre-vingt-dix'].freeze
  CENT = 'cent'.freeze
  HUNDREDS_AS_STRING = ([ZERO, CENT] + BASIC_UNITS.map { |unit| unit + '-' + CENT }).freeze

  def initialize(number)
    @original_number = number
  end

  def to_s
    @temp_number = @original_number
    return ZERO if @original_number.zero?

    hundred_as_string = get_hundred_as_string
    ten_as_string = get_ten_as_string
    unit_as_string = UNITS_AS_STRING[@temp_number]

    number_as_string = [hundred_as_string, ten_as_string, unit_as_string]
                       .reject { |c| c == ZERO }.join('-')

    remove_unnecessary_et(pluralize_vingt_and_cent(number_as_string), @original_number)
  end

  private

  def get_hundred_as_string
    hundred = @temp_number / 100
    @temp_number -= hundred * 100
    HUNDREDS_AS_STRING[hundred]
  end

  def get_ten_as_string
    ten = @temp_number / 10
    ten -= 1 if [1, 7, 9].include? ten
    @temp_number -= (ten * 10)
    TENS_AS_STRING[ten]
  end

  def remove_unnecessary_et(number_as_string, number)
    number_as_string.slice! 'et-' if [1, 11, 81, 91].include?(number % 100)
    number_as_string
  end

  def pluralize_vingt_and_cent(number_as_string)
    pluralize(number_as_string, CENT)
  end

  def pluralize(number_as_string, to_pluralize)
    number_as_string += 's' if number_as_string =~ /.(vingt|#{to_pluralize})$/
    number_as_string
  end
end
