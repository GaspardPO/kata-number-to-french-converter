require 'test/unit'

def translate_to_french(number)
  if number == 0
    return "zero"
  end
  if 10 < number && number < 20
    ten_twenty = ["", "onze", "douze", "treize", "quatorze", "quinze", "seize", "dix-sept", "dix-huit", "dix-neuf"]
    return ten_twenty[number-10]
  end

  units_as_string = ["", "un", "deux", "trois", "quatre", "cinq", "six", "sept", "huit", "neuf"]
  tens_as_string = ["", "dix", "vingt", "trente", "quarante", "cinquante", "soixante", "soixante-dix", "quatre-vingts", "quatre-vingt-dix"]
  tens_as_string[number/10] + units_as_string[number%10]
end
