ZERO = "zéro"

class Number

  BASIC_UNITS = ["deux", "trois", "quatre", "cinq", "six", "sept", "huit", "neuf"]
  UNITS_AS_STRING = [ZERO, "et-un"] + BASIC_UNITS + ["dix", "et-onze", "douze", "treize", "quatorze", "quinze", "seize", "dix-sept", "dix-huit", "dix-neuf"]
  TENS_AS_STRING = [ZERO, "dix", "vingt", "trente", "quarante", "cinquante", "soixante", "soixante-dix", "quatre-vingt", "quatre-vingt-dix"]
  CENT = "cent"
  HUNDREDS_AS_STRING = [ZERO, CENT] + BASIC_UNITS.map {|unit| unit + "-" + CENT}

  def initialize number
    @original_number = number
  end

  def to_s
    @temp_number = @original_number

    if @original_number == 0
      return ZERO
    end

    hundred_as_string = get_hundred_as_string
    ten_as_string = get_ten_as_string
    unit_as_string = UNITS_AS_STRING[@temp_number]

    number_as_string = [hundred_as_string, ten_as_string, unit_as_string]
                           .reject {|c| c == ZERO}
                           .join("-")

    remove_unnecessary_et(pluralize(number_as_string, CENT), @original_number)
  end


  private

  def get_hundred_as_string
    hundred = @temp_number / 100
    @temp_number -= hundred * 100
    HUNDREDS_AS_STRING[hundred]
  end

  def get_ten_as_string
    ten = @temp_number / 10
    if [1, 7, 9].include? ten
      ten -= 1
    end
    @temp_number = @temp_number - (ten * 10)
    TENS_AS_STRING[ten]
  end

  def remove_unnecessary_et(number_as_string, number)
    if [1, 11, 81, 91].include? number % 100
      number_as_string.slice! "et-"
    end
    number_as_string
  end

  def pluralize(number_as_string, to_pluralize)
    if number_as_string =~ /.(vingt|#{to_pluralize})$/
      number_as_string += 's'
    end
    number_as_string
  end
end