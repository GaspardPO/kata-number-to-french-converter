ZERO = "zéro"
UNITS_AS_STRING = [ZERO, "et-un", "deux", "trois", "quatre", "cinq", "six", "sept", "huit", "neuf", "dix", "et-onze", "douze", "treize", "quatorze", "quinze", "seize", "dix-sept", "dix-huit", "dix-neuf"]
TENS_AS_STRING = [ZERO, "dix", "vingt", "trente", "quarante", "cinquante", "soixante", "soixante-dix", "quatre-vingt", "quatre-vingt-dix"]

class Translator

  def initialize number
    @original_number = number.clone
    @number = number
  end

  def translate
    if @original_number == 0
      return ZERO
    end

    if @original_number >= 100
      hundreds = "cent"
      @number -= 100
    else
      hundreds = ZERO
    end
    ten_as_string = get_ten_as_string
    unit_as_string = UNITS_AS_STRING[@number]

    number_as_string = [hundreds, ten_as_string, unit_as_string]
                           .reject {|c| c == ZERO}
                           .join("-")

    remove_unnecessary_et(add_plural(number_as_string), @original_number)
  end


  private
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
    if number_as_string =~ /.vingt$/
      number_as_string += 's'
    end
    number_as_string
  end
end

def translate_to_french(number)
  translator = Translator.new number

  translator.translate
end
