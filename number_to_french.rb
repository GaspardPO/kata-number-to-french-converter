ZERO = "zéro"
UNITS_AS_STRING = [ZERO, "et-un", "deux", "trois", "quatre", "cinq", "six", "sept", "huit", "neuf", "dix", "onze", "douze", "treize", "quatorze", "quinze", "seize", "dix-sept", "dix-huit", "dix-neuf"]
TENS_AS_STRING = [ZERO, "dix", "vingt", "trente", "quarante", "cinquante", "soixante", "soixante-dix", "quatre-vingt", "quatre-vingt-dix"]

def translate_to_french(number)
  if number == 0
    return ZERO
  end

  if number == 1
    return "un"
  end

  ten = get_ten(number)
  ten_as_string = TENS_AS_STRING[ten]
  unit_as_string = get_unit(number, ten)

  number_as_string = [ten_as_string, unit_as_string]
                         .reject {|c| c == ZERO}
                         .join("-")

  add_plural(number_as_string)
end

private
def add_plural(number_as_string)
  if number_as_string =~ /.vingt$/
    number_as_string += 's'
  end
  number_as_string
end

def get_ten(number)
  ten = number / 10
  if ten == 1 || ten == 7
    ten -= 1
  end
  ten
end

def get_unit(number, ten)
  rest = number - (ten * 10)
  UNITS_AS_STRING[rest]
end
