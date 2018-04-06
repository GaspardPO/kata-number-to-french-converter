require 'test/unit'

def translate_to_french(number)
  if number == 0
    return "zero"
  end

  units_as_string = ["", "un", "deux", "trois", "quatre", "cinq", "six", "sept", "huit", "neuf"]
  tens_as_string = ["", "dix", "vingt", "trente", "quarante", "cinquante", "soixante", "soixante-dix", "quatre-vingts", "quatre-vingt-dix"]
  tens_as_string[number / 10] + units_as_string[number % 10]
end
