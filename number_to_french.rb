require 'test/unit'

ZERO = "zéro"

def translate_to_french(number)
  units_as_string = [ZERO, "un", "deux", "trois", "quatre", "cinq", "six", "sept", "huit", "neuf", "dix", "onze", "douze", "treize", "quatorze", "quinze", "seize"]
  units_as_string_when_bigger_than_20 = units_as_string.clone
  units_as_string_when_bigger_than_20[1] = "et-un"

  tens_as_string = [ZERO, "dix", "vingt", "trente", "quarante", "cinquante", "soixante", "soixante-dix", "quatre-vingts", "quatre-vingt-dix"]

  if number < 17
    return units_as_string[number]
  end

  [tens_as_string[number / 10], units_as_string_when_bigger_than_20[number % 10]]
      .reject {|c| c == ZERO  }
      .join("-")
end
