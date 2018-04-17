ZERO = "zéro"
BASIC_UNITS = ["deux", "trois", "quatre", "cinq", "six", "sept", "huit", "neuf"]
UNITS_AS_STRING = [ZERO, "et-un"] + BASIC_UNITS + ["dix", "et-onze", "douze", "treize", "quatorze", "quinze", "seize", "dix-sept", "dix-huit", "dix-neuf"]
TENS_AS_STRING = [ZERO, "dix", "vingt", "trente", "quarante", "cinquante", "soixante", "soixante-dix", "quatre-vingt", "quatre-vingt-dix"]
CENT = "cent"
HUNDREDS_AS_STRING = [ZERO, CENT] + BASIC_UNITS.map {|unit| unit + "-" + CENT}
MILLE = "mille"
THOUSANDS_AS_STRING = [ZERO, MILLE] + BASIC_UNITS.map {|unit| unit + "-" + MILLE}

class Translator

  def initialize number
    @original_number = number.clone
    @number = number
  end

  def translate
    if @original_number == 0
      return ZERO
    end

    thousand_as_string = get_thousand_as_string
    hundred_as_string = get_hundred_as_string
    ten_as_string = get_ten_as_string
    unit_as_string = UNITS_AS_STRING[@number]

    number_as_string = [thousand_as_string, hundred_as_string, ten_as_string, unit_as_string]
                           .reject {|c| c == ZERO}
                           .join("-")

    remove_unnecessary_et(add_plural(number_as_string), @original_number)
  end


  private

  def get_thousand_as_string
    thousand = @number / 1000
    @number -= thousand * 1000
    if thousand > 1
      translate_to_french(thousand) + "-" + MILLE
    elsif thousand == 1
      MILLE
    else
      ZERO
    end
  end

  def get_hundred_as_string
    hundred = @number / 100
    @number -= hundred * 100
    HUNDREDS_AS_STRING[hundred]
  end

  def get_ten_as_string
    ten = @number / 10
    if [1, 7, 9].include? ten
      ten -= 1
    end
    @number = @number - (ten * 10)
    TENS_AS_STRING[ten]
  end

  def remove_unnecessary_et(number_as_string, number)
    if [1, 11, 81, 91].include? number
      number_as_string.slice! "et-"
    end
    number_as_string
  end

  def add_plural(number_as_string)
    if number_as_string =~ /.(vingt|#{CENT}|#{MILLE})$/
      number_as_string += 's'
    end
    number_as_string
  end
end

def translate_to_french(number)
  translator = Translator.new number
  translator.translate
end
