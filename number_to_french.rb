require 'test/unit'

ZERO = "zéro"

def add_plural(number_as_string)
  if number_as_string =~ /.vingt$/
    number_as_string += 's'
  end
  number_as_string
end

def translate_to_french(number)
  units_as_string = [ZERO, "un", "deux", "trois", "quatre", "cinq", "six", "sept", "huit", "neuf", "dix", "onze", "douze", "treize", "quatorze", "quinze", "seize"]
  units_as_string_when_bigger_than_20 = units_as_string.clone
  units_as_string_when_bigger_than_20[1] = "et-un"

  tens_as_string = [ZERO, "dix", "vingt", "trente", "quarante", "cinquante", "soixante", "soixante-dix", "quatre-vingt", "quatre-vingt-dix"]

  if number < 17
    return units_as_string[number]
  end

  number_as_string = [tens_as_string[number / 10], units_as_string_when_bigger_than_20[number % 10]]
                         .reject {|c| c == ZERO}
                         .join("-")

  add_plural(number_as_string)
end
